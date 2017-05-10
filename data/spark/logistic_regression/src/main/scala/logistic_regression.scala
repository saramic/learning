import org.apache.spark.SparkContext
import org.apache.spark.SparkConf
import org.apache.spark.sql.types.{StructType,StructField,StringType,DoubleType}
import org.apache.spark.sql.Row
import org.apache.spark.sql.DataFrame
import org.apache.spark.ml.feature.StringIndexer
import org.apache.spark.ml.feature.StringIndexerModel
import org.apache.spark.ml.feature.OneHotEncoder
import org.apache.spark.ml.feature.VectorAssembler
import org.apache.spark.ml.classification.LogisticRegression
import org.apache.spark.ml.classification.LogisticRegressionModel
import org.apache.spark.ml.param.ParamMap
import org.apache.spark.ml.evaluation.BinaryClassificationEvaluator
import org.apache.spark.mllib.evaluation.BinaryClassificationMetrics
import org.apache.spark.ml.tuning.CrossValidator
import org.apache.spark.ml.tuning.ParamGridBuilder

object logistic_regression {
  def main(args: Array[String]) {
    var sc = new SparkContext(new SparkConf().setMaster("local")
      .setAppName("logistic_regression"))

    val sqlContext = new org.apache.spark.sql.SQLContext(sc)

    val census_raw = sc.textFile("data/adult.raw", 4).
      map(x => x.split(", ")).
      map(row => row.map(x => try { x.toDouble }
      catch { case _ : Throwable => x}))

    val adultschema = StructType(Array(
      StructField("age",DoubleType,true),
      StructField("workclass",StringType,true),
      StructField("fnlwgt",DoubleType,true),
      StructField("education",StringType,true),
      StructField("marital_status",StringType,true),
      StructField("occupation",StringType,true),
      StructField("relationship",StringType,true),
      StructField("race",StringType,true),
      StructField("sex",StringType,true),
      StructField("capital_gain",DoubleType,true),
      StructField("capital_loss",DoubleType,true),
      StructField("hours_per_week",DoubleType,true),
      StructField("native_country",StringType,true),
      StructField("income",StringType,true)
    ))

    val dfraw = sqlContext.createDataFrame(census_raw.map(Row.fromSeq(_)), adultschema)

    dfraw.show(5)

    dfraw.groupBy(dfraw("workclass")).count().rdd.foreach(println)

    val dfrawrp = dfraw.na.replace(Array("workclass"),
      Map("?" -> "Private"))
    val dfrawrpl = dfrawrp.na.replace(Array("occupation"),
      Map("?" -> "Prof-specialty"))
    val dfrawnona = dfrawrpl.na.replace(Array("native_country"),
      Map("?" -> "United-States"))

    val dfnumeric = indexStringColumns(dfrawnona, Array("workclass",
      "education", "marital_status", "occupation", "relationship",
      "race", "sex", "native_country", "income"))

    dfnumeric.show(5)

    val dfhot = oneHotEncodeColumns(dfnumeric, Array("workclass",
      "education", "marital_status", "occupation", "relationship",
      "race", "native_country"))

    dfhot.show(5)

    val va = new VectorAssembler().setOutputCol("features")
    va.setInputCols(dfhot.columns.diff(Array("income")))
    val lpoints = va.transform(dfhot).select("features", "income").withColumnRenamed("income", "label")

    lpoints.show(5)

    val splits = lpoints.randomSplit(Array(0.8, 0.2))
    val adulttrain = splits(0).cache()
    val adultvalid = splits(1).cache()

    val lr = new LogisticRegression
    lr.setRegParam(0.01).setMaxIter(500).setFitIntercept(true)
    val lrmodel = lr.fit(adulttrain)

    // optionally like this
    //val lrmodel = lr.fit(adulttrain, ParamMap(lr.regParam -> 0.01, lr.maxIter -> 500, lr.fitIntercept -> true))

    println(s"Coefficients: ${lrmodel.coefficients}")
    println(s"Intercept: ${lrmodel.intercept}")

    val validpredicts = lrmodel.transform(adultvalid)

    validpredicts.show(5)

    val bceval = new BinaryClassificationEvaluator()
    println(bceval.evaluate(validpredicts))
    println(bceval.getMetricName)
    // [info] 0.903769831888553
    // [info] areaUnderROC

		computePRCurve(adulttrain, adultvalid, lrmodel)
    computeROCCurve(adulttrain, adultvalid, lrmodel)

		val cv = new CrossValidator().setEstimator(lr).setEvaluator(bceval).setNumFolds(5)
		val paramGrid = new ParamGridBuilder().addGrid(lr.maxIter, Array(1000)).
    	addGrid(lr.regParam, Array(0.0001, 0.001, 0.005, 0.01, 0.05, 0.1, 0.5)).build()
		cv.setEstimatorParamMaps(paramGrid)
		val cvmodel = cv.fit(adulttrain)

    cvmodel.bestModel.asInstanceOf[LogisticRegressionModel].coefficients
		cvmodel.bestModel.parent.asInstanceOf[LogisticRegression].getRegParam

		println(new BinaryClassificationEvaluator().evaluate(cvmodel.bestModel.transform(adultvalid)))
    // [info] 0.9053890832107185
  }

  def indexStringColumns(df:DataFrame, cols:Array[String]):DataFrame = {
    var newdf = df
    for(col <- cols) {
      val si = new StringIndexer().setInputCol(col).setOutputCol(col+"-num")
      val sm:StringIndexerModel = si.fit(newdf)
      newdf = sm.transform(newdf).drop(col)
      newdf = newdf.withColumnRenamed(col+"-num", col)
		}
		newdf
	}

  def oneHotEncodeColumns(df:DataFrame, cols:Array[String]):DataFrame = {
    var newdf = df
    for(c <- cols) {
      val onehotenc = new OneHotEncoder().setInputCol(c)
      onehotenc.setOutputCol(c+"-onehot").setDropLast(false)
      newdf = onehotenc.transform(newdf).drop(c)
      newdf = newdf.withColumnRenamed(c+"-onehot", c)
    }
    newdf
  }

  def computePRCurve(train:DataFrame, valid:DataFrame, lrmodel:LogisticRegressionModel) = {
    for(threshold <- 0 to 10)
    {
        var thr = threshold/10.0
        if(threshold == 10)
            thr -= 0.001
        lrmodel.setThreshold(thr)
        val validpredicts = lrmodel.transform(valid).rdd
        val validPredRdd = validpredicts.map(row => (row.getDouble(4), row.getDouble(1)))
        val bcm = new BinaryClassificationMetrics(validPredRdd)
        val pr = bcm.pr.collect()(1)
        println("%.1f: R=%f, P=%f".format(thr, pr._1, pr._2))
    }
  }

  def computeROCCurve(train:DataFrame, valid:DataFrame, lrmodel:LogisticRegressionModel) = {
    for(threshold <- 0 to 10)
    {
        var thr = threshold/10.0
        if(threshold == 10)
            thr -= 0.001
        lrmodel.setThreshold(thr)
        val validpredicts = lrmodel.transform(valid).rdd
        val validPredRdd = validpredicts.map(row => (row.getDouble(4), row.getDouble(1)))
        val bcm = new BinaryClassificationMetrics(validPredRdd)
        val pr = bcm.roc.collect()(1)
        println("%.1f: FPR=%f, TPR=%f".format(thr, pr._1, pr._2))
    }
  }
}
