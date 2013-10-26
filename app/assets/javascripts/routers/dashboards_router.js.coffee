class Minurl.Routers.Dashboards extends Backbone.Router
  routes:
    '': 'index'

    index: ->
      view = new Minurl.Views.DashboardsIndex()
      $('#table').html(view.render().el)