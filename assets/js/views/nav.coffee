define ['app', 'marionette', 'templates'], (App, Marionette, templates) ->
  class NavigationView extends Marionette.ItemView
    template: templates.nav

    events:
      'click .root': 'link_to_root'
      'click .category': 'link_to_category'

    templateHelpers: ->
      folder: (->
        category = @model.get("id").split("/")
        category_length = category.length
        category.splice(category_length - 1, 1)
        category = category.join('/')
        category
      ).bind(@)

    link_to_root: ->
      App.request('router').navigate('/', {trigger: true})
      console.log @model.get('id')

    link_to_category: ->
      console.log @model
      # App.request('router').navigate('/', {trigger: true})
