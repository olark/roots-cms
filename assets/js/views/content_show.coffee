define ['app', 'marionette', 'templates', 'marked', 'pen', 'html_md', 'pen_markdown'], (App, Marionette, templates, marked, Pen, md) ->
  class ContentShow extends Marionette.ItemView
    template: templates.content_show

    ui:
      'content': '.contents'

    events:
      'click button': 'save'
      'click span': 'link_to_folder'

    templateHelpers: ->
      folders: (->
        categories = @model.get("id").split("/")
        categories_length = categories.length
        categories.splice(categories_length - 1, 1)
        categories
      ).bind(@)

      content_to_html: (-> marked(@model.get('content'))).bind(@)


    onRender: ->
      new Pen(@ui.content[0])

    save: ->
      modified_content = md(@ui.content.html())
      @model.set('content', modified_content)
      @model.save()


    link_to_folder: (e) ->
      link = e.target.innerHTML.replace('/',"")
      path = 'category/' + link
      App.request('router').navigate(path, {trigger: true})
