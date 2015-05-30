class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<div><img src="./img/cards/<%= rankName %>-<%= suitName %>.png"></div>'

  #'<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    # @$el.addClass 'covered' unless @model.get 'revealed'
    unless @model.get 'revealed'
      @$el.addClass 'covered'
      @$el.empty()

