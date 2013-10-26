window.Minurl =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new Minurl.Routers.Dashboards()
    Backbone.history.start()

$(document).ready ->
  Minurl.initialize()
