import org.apache.spark.SparkContext
import org.apache.spark.SparkConf
import org.apache.spark.graphx._

object citation_page_rank {
  def main(args: Array[String]) {
    var sc = new SparkContext(new SparkConf().setMaster("local")
    .setAppName("citation_page_rank"))

    val graph = GraphLoader.edgeListFile(sc, "data/cit-HepTh.txt")
    println("Most degrees in")
    println(graph.inDegrees.reduce((a, b) => if (a._2 > b._2) a else b))
    // (9711200,2414)

    println("first 10 verticies")
    graph.vertices.take(10)
      .foreach(println(_))
    // (9405166,1)
    // (108150,1)
    // (110163,1)
    // ...

    val v = graph.pageRank(0.001).vertices

    println("first 10 vericies with pagerank calculated")
    v.take(10).foreach(println(_))
    // (9405166,1.336783076434938)
    // (108150,0.5836164464324066)
    // (110163,0.15)
    // ...

    val result = v.reduce((a,b) => if(a._2 > b._2) a else b)
    println("PageRank vertex")
    println(result)
    // (9207016,85.27317386053808)
 
    sc.stop
  }
}


