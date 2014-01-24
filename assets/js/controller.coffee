define ['app', 'marionette', 'collections/categories', 'models/content', 'views/categories', 'views/content_show', 'views/posts', 'views/nav'], (App, Marionette, Categories, Content, CategoriesView, ContentShowView, PostsView, NavigationView) ->
  class Controller extends Marionette.Controller
    list_categories: ->
      (new Categories).fetch
        success: (collection, res, opts) ->
          App.navigation.reset()
          App.content.show(new CategoriesView(collection: collection))
        fail: (collection, res, opts) -> console?.log?(collection, res, opts)

    show_content: (path) ->
      App.navigation.reset()

      # Find cached model in Backbone Relational store if exists
      if model = Content.findOrCreate(path)
        return App.content.show(new ContentShowView(model: model))

      (new Content(id: path)).fetch
        success: (model, res, opts) ->
          App.content.show(new ContentShowView(model: model))
          App.navigation.show(new NavigationView(model: model))
        fail: (model, res, opts) -> console.log(model, res, opts)

    list_posts: (folder) ->
      (new Categories).fetch
        success: (collection, res, opts) ->
          category = collection.find (m) -> m.get('name') == folder
          posts = category.get('content')
          App.content.show(new PostsView(collection: posts))
          App.navigation.show(new NavigationView(model: category))
        fail: (model, res, opts) -> console.log(model, res, opts)
