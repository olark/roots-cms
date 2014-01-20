define ['app', 'marionette', 'templates', 'jqueryui'], (App, Marionette, templates) ->
  class PostView extends Marionette.ItemView
    template: templates.post
    tagName: 'li'

    events:
      'click': 'path'

    templateHelpers: ->
      file: (-> @model.get('id').split('/').reverse()[0]).bind(@)

    path: ->
      path = 'content/' + @model.get('id')
      App.request('router').navigate(path, {trigger: true})
