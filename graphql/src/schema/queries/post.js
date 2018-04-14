import { GraphQLInt, GraphQLNonNull } from "graphql"
import { Post } from "../types/Post"
import { fakeDatabase } from "../../fakeDatabase"

export default {
  post: {
    type: Post,
    description: 'Get details of a spacific post',
    args: {
      id: { type: GraphQLNonNull(GraphQLInt) }
    },
    resolve: function(parent, { id }) {
      return fakeDatabase.getBlogPosts(id);
    }
  }
}
