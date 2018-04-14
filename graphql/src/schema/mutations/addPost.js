import { GraphQLList } from "graphql"
import { Post, PostInputType } from "../types/Post"
import { fakeDatabase } from "../../fakeDatabase"

export default {
  addPost: {
    type: Post,
    description: 'Creates a new blog post',
    args: {
      post: { type: PostInputType }
    },
    resolve: function(parent, { post }) {
      return fakeDatabase.addNewBlogPost(post);
    }
  }
}
