define ['marionette'], (Marionette) ->
  App = new Marionette.Application()

  App.addRegions
    content: '#content'
    navigation: '#nav'

  return App
