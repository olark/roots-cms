require.config
  shim:
    underscore: { exports: '_' }
    backbone: { deps: ['jquery', 'underscore'], exports: 'Backbone' }
    backbone_relational: { deps: ['backbone'] }
    marionette: { deps: ['backbone'], exports: 'Marionette' }

  paths:
    backbone: ['vendor/backbone']
    backbone_relational: ['vendor/backbone-relational']
    jquery: ['vendor/jquery']
    jqueryui: ['vendor/jqueryui']
    marionette: ['vendor/backbone.marionette']
    underscore: ['vendor/underscore']

require ['marionette', 'collections/categories', 'views/categories'], (Marionette, Categories, CategoriesView) ->
  App = new Marionette.Application()

  App.addRegions
    content: '#content'

  App.on 'initialize:after', ->
    categories = new Categories
    categories.fetch
      success: (collection, res, opts) ->
        App.content.show(new CategoriesView(collection: collection))
      fail: (collection, res, opts) -> console?.log?(collection, res, opts)

  App.start()
