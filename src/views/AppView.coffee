class window.AppView extends Backbone.View
  template: _.template '
    <div class="container">
      <div class="wingif .col-md-6 .col-md-offset-3"></div>
      <div class="player-hand-container"></div>
      <div class="dealer-hand-container"></div>
      <button class="btn btn-primary hit-button">Hit</button> <button class="btn btn-success stand-button">Stand</button>
    </div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()
    @model.get('gameLogic').on 'change:winner', =>
      if @model.get('gameLogic').get('winner')
        $('.dealer-hand-container').addClass 'winning'
      else
        $('.player-hand-container').addClass 'winning'
      @renderWin()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  renderWin: ->
    @$el.children().detach()
    @$el.html @template()
    $('.wingif').append('<div>').html '<img src="https://mypenmyvoice.files.wordpress.com/2014/09/tumblr_mi6xc7l6be1s5ys1do1_500.gif">'
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
