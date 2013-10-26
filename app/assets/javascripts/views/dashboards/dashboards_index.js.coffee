class Minurl.Views.DashboardsIndex extends Backbone.View

  template: JST['dashboards/index']

  render: ->
    $(@el).html(@template())
    @