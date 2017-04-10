import org.apache.spark.SparkContext
import org.apache.spark.SparkConf
import org.apache.spark.graphx._

object distance_graph {
  def main(args: Array[String]) {
    var sc = new SparkContext(new SparkConf().setMaster("local")
    .setAppName("distance_graph"))

    val dist = sc.textFile("data/animal_distances.txt")
    val verts = dist.map(_.split(",")(0)).distinct.
      map(x => (x.hashCode.toLong, x))
    val edges = dist.map(x => x.split(",")).
      map(x => Edge(x(0).hashCode.toLong,
                    x(1).hashCode.toLong,
                    x(2).toDouble))
    val distg = Graph(verts, edges)
    val mst = minSpanningTree(distg)
    val pw = new java.io.PrintWriter("data/animal_taxonomy.gexf")
    pw.write(toGexf(mst))
    pw.close

    sc.stop
  }

  def toGexf[VD,ED](g:Graph[VD,ED]) =
      "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
      "<gexf xmlns=\"http://www.gexf.net/1.2draft\" version=\"1.2\">\n" +
      "  <graph mode=\"static\" defaultedgetype=\"directed\">\n" +
      "    <nodes>\n" +
      g.vertices.map(v => "      <node id=\"" + v._1 + "\" label=\"" +
                          v._2 + "\" />\n").collect.mkString +
      "    </nodes>\n" +
      "    <edges>\n" +
      g.edges.map(e => "      <edge source=\"" + e.srcId +
                       "\" target=\"" + e.dstId + "\" label=\"" + e.attr +
                       "\" />\n").collect.mkString +
      "    </edges>\n" +
      "  </graph>\n" +
      "</gexf>"

  // val pw = new java.io.PrintWriter("myGraph.gexf")
  // pw.write(toGexf(myGraph))
  // pw.close

  def minSpanningTree[VD:scala.reflect.ClassTag](g:Graph[VD,Double]) = {
    var g2 = g.mapEdges(e => (e.attr,false))

    for (i <- 1L to g.vertices.count-1) {
      val unavailableEdges =
        g2.outerJoinVertices(g2.subgraph(_.attr._2)
                               .connectedComponents
                               .vertices)((vid,vd,cid) => (vd,cid))
          .subgraph(et => et.srcAttr._2.getOrElse(-1) ==
                            et.dstAttr._2.getOrElse(-2))
          .edges
          .map(e => ((e.srcId,e.dstId),e.attr))

      type edgeType = Tuple2[Tuple2[VertexId,VertexId],Double]

      val smallestEdge =
        g2.edges
          .map(e => ((e.srcId,e.dstId),e.attr))
          .leftOuterJoin(unavailableEdges)
          .filter(x => !x._2._1._2 && x._2._2.isEmpty)
          .map(x => (x._1, x._2._1._1))
          .min()(new Ordering[edgeType]() {
             override def compare(a:edgeType, b:edgeType) = {
               val r = Ordering[Double].compare(a._2,b._2)
               if (r == 0)
                 Ordering[Long].compare(a._1._1, b._1._1)
               else
                 r
             }
           })

      g2 = g2.mapTriplets(et =>
        (et.attr._1, et.attr._2 || (et.srcId == smallestEdge._1._1
                                    && et.dstId == smallestEdge._1._2)))
    }

    g2.subgraph(_.attr._2).mapEdges(_.attr._1)
  }

  //minSpanningTree(myGraph).triplets.map(et => (et.srcAttr,et.dstAttr)).collect
}


