define ['app', 'marionette', 'templates'], (App, Marionette, templates) ->
  class NavigationView extends Marionette.ItemView
    template: templates.nav

    events:
      'click .back': 'link_to_root'

    link_to_root: ->
      App.request('router').navigate('/', {trigger: true})
