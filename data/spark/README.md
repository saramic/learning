
# page rank demo

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


# triange count

    ```bash
    wget http://snap.stanford.edu/data/soc-Slashdot0811.txt.gz
    gunzip soc-Slashdot0811.txt.gz
    ```

    ```spark
    
    ```
