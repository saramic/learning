import { GraphQLObjectType, GraphQLString, GraphQLInt } from "graphql"

export const Comment = new GraphQLObjectType({
  name: "Comment",
  description: "Details of a comment",
  fields: () => [{
    id: { type: GraphQLInt },
    name: { type: GraphQLString },
    content: { type: GraphQLString }
  }]
})
