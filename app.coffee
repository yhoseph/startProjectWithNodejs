class App
  constructor: () ->
    @loadApp()

  serverOn: () =>
    host = @server.address().address;
    port = @server.address().port;
    console.log 'Example app listening at http://%s:%s', host, port

  configure: () =>
    @app.use @express.static __dirname + '/client'

  requestServer: (request, response) =>
    response.sendfile './client/index.html'

  loadApp: () =>
    @express = require 'express'
    @app = @express()
    @configure()
    @app.get '/', @requestServer
    @server = @app.listen 3000, @serverOn

new App()
