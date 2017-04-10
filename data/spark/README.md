# Learning Spark

base on Spark in Action and GraphX in Action.

## TODO

- [ ] run pagerank/triangle count in an interactive way
- [ ] run pagerank/triangle as a service
- [ ] read up on latest Spark releases (book is 1.6 current is 2.1)
  - [ ] [via release notes](http://spark.apache.org/releases/spark-release-2-1-0.html)
  - [ ] [graphX overview](http://spark.apache.org/docs/latest/graphx-programming-guide.html)
  - [ ] new [CSV data souroce](https://github.com/databricks/spark-csv)
  - [ ] changes in [MLlib 2.0.0 ?](http://spark.apache.org/docs/2.0.0/ml-guide.html)
  - [ ] changes in [MLlib 2.1.0 !](http://spark.apache.org/docs/2.1.0/ml-guide.html)
	- [ ] [model persistance changes in Spark 2.0](https://databricks.com/blog/2016/05/31/apache-spark-2-0-preview-machine-learning-model-persistence.html)
	- [ ] [MLlib 2.0 preivew video](https://spark-summit.org/2016/events/apache-spark-mllib-20-preview-data-science-and-production/)
	- [ ] [SparkR video](https://spark-summit.org/2016/events/recent-developments-in-sparkr-for-advanced-analytics/)
	- [ ] [SparR (R on Spark)](http://spark.apache.org/docs/2.1.0/sparkr.html)
	- [ ] [handling late data and watermarking](http://spark.apache.org/docs/2.1.0/structured-streaming-programming-guide.html#handling-late-data-and-watermarking)
  - [ ] [structured streaming + kafka integration](http://spark.apache.org/docs/2.1.0/structured-streaming-kafka-integration.html)
- [ ] apply pagerank to own data
- [ ] deriving taxonomies
- [ ] apply taxonomy derivation to
  - [ ] image taxonomy problem
  - [ ] search term taxonomy problem
- [ ] integrate with a visualization frontend
- [ ] use a spark cluster

## Deriving Taxonomies

for a list of words, generate a graph based on Google news word similarity

```
cd deriving_taxonomies
```

## Page Rank

```
cd citation_page_rank
sbt run
```

## Triangle Count

```
cd slashdot_friend_foe
sbt run
```

## In spark shell

### page rank demo

page rank on high energy physics theory

    ```bash
    wget http://snap.stanford.edu/data/cit-HepTh.txt.gz
    gunzip cit-HepTh.txt.gz 

    spark-shell
    ```

    ```spark
    scala> import org.apache.spark.graphx._
    scala> val graph = GraphLoader.edgeListFile(sc, "data/cit-HepTh.txt")
    scala> graph.inDegrees.reduce((a, b) => if (a._2 > b._2) a else b)
    res0: (org.apache.spark.graphx.VertexId, Int) = (9711200,2414)

    scala> graph.vertices.take(10)
    res1: Array[(org.apache.spark.graphx.VertexId, Int)] = Array((9405166,1), (9312172,1), (108150,1), (9166,1), (204100,1), (9703222,1), (9709148,1), (105040,1), (9811116,1), (103184,1))

    scala> val v = graph.pageRank(0.001).vertices

    scala> v.take(10)
    res2: Array[(org.apache.spark.graphx.VertexId, Double)] = Array((9405166,1.336783076434938), (9312172,2.903223441074881), (108150,0.5836164464324067), (9166,0.1851148835685028), (204100,0.19080382117882116), (9703222,0.16521611205688394), (9709148,0.22176221523472583), (105040,0.1682142857142857), (9811116,0.16205534399980323), (103184,0.20437621370972553))

    scala> v.reduce((a,b) => if(a._2 > b._2) a else b)
    res3: (org.apache.spark.graphx.VertexId, Double) = (9207016,85.27317386053811)
    ```

    9711200 was cited 2414 times
    9207016 was most influential according to page rank

