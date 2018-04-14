import {graphql} from 'graphql'
import schema from "./schema/"

const query = `
  {
    posts {
      title,
      author {
        name
      }
    }
  }
`

graphql(schema, query).then(result => {
  console.log(JSON.stringify(result, null, 2))
}).catch(error => {
  console.log(error)
})
