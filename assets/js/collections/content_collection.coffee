define ['jquery', 'models/content', 'backbone_relational'], ($, Content) ->
  class ContentCollection extends Backbone.Collection
    model: Content
    url: '/api/content'

    comparator: (m) -> m.get('order')
