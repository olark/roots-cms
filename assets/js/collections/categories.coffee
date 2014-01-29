define ['jquery', 'backbone'], ($, Backbone) ->
  class Categories extends Backbone.Collection
    url: '/api/categories'

    comparator: (m) -> m.get('name')
