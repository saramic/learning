const http = require('http')
const ping = (_, res) => {
  res.writeHead(200)
  res.end(JSON.stringify({
    message: 'ping'
  }))
}
const server = http.createServer(ping)
const port = process.env.PORT || 5000
const host = process.env.HOST || 'localhost'
server.listen(port, host)
console.log(`started server at ${host}:${port}`)