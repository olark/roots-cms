define ['backbone', 'collections/content_collection', 'collections/categories', 'models/content', 'backbone_relational'], (Backbone, ContentCollection, Categories, Content) ->
  class Category extends Backbone.RelationalModel
    url: '/api_spec.json'

    relations: [
      {
        type: Backbone.HasMany
        key: 'content'
        relatedModel: Content
        collectionType: ContentCollection
      },
      {
        type: Backbone.HasMany
        key: 'subcategories'
        relatedModel: @
        collectionType: Categories
      }
    ]
