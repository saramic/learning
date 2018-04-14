import { GraphQLList } from "graphql"
import { Comment, CommentInputType } from "../types/Comment"
import { fakeDatabase } from "../../fakeDatabase"

export default {
  addComment: {
    type: Comment,
    description: 'Creates a new comment',
    args: {
      comment: { type: CommentInputType }
    },
    resolve: function(parent, { comment }) {
      return fakeDatabase.addNewComment(comment);
    }
  }
}
