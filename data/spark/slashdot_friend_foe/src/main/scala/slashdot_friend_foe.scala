import org.apache.spark.SparkContext
import org.apache.spark.SparkConf
import org.apache.spark.graphx._

object slashdot_friend_foe {
  def main(args: Array[String]) {
    var sc = new SparkContext(new SparkConf().setMaster("local")
    .setAppName("slashdot_friend_foe"))

    val graph = GraphLoader.edgeListFile(sc, "data/soc-Slashdot0811.txt").cache

    val graph2 = Graph(graph.vertices, graph.edges.map(e =>
        if (e.srcId < e.dstId) e else new Edge(e.dstId, e.srcId, e.attr))).
      partitionBy(PartitionStrategy.RandomVertexCut)

    println((0 to 6).map(i => graph2.subgraph(vpred =
      (vid,_) => vid >= i*10000 && vid < (i+1)*10000).
    triangleCount.vertices.map(_._2).reduce(_ + _)))

    sc.stop
  }
}


