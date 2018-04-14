import { GraphQLList } from "graphql"
import { Post } from "../types/Post"
import { fakeDatabase } from "../../fakeDatabase"

export default {
  posts: {
    type: new GraphQLList(Post),
    description: 'Get a list of recent blog posts',
    args: { },
    resolve: function() {
      return fakeDatabase.getBlogPosts();
    }
  }
}
