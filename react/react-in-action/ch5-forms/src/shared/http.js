import fetch from "isomorphic-fetch"

function generateFetchConfig(method, body = null) {
  const upCaseMethod = method.toUpperCase()
  const config = {
    method: upCaseMethod,
    headers: {
      "Content-type": "applciation/json",
    }
  }
  if (["POST", "PUT"].includes(upCaseMethod)) {
    config.body = JSON.stringify(body)
  }
  return config
}

export function createPost(payload) {
  return fetch(`${process.env.ENDPOINT}/posts`, generateFetchConfig("POST", payload))
}
