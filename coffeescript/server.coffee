http = require("http")
fs = require("fs")
index = fs.readFileSync("test.html")
http.createServer((req, res) ->
  res.writeHead 200,
    "Content-Type": "text/html"
  res.end index
).listen 8888