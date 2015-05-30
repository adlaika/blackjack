class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()
    @model.get('gameLogic').on 'change:winner', => @renderWin()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  renderWin: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html '<img src="https://mypenmyvoice.files.wordpress.com/2014/09/tumblr_mi6xc7l6be1s5ys1do1_500.gif">'
    @$('.dealer-hand-container').text "player score: " + @model.get('playerHand').scores() + " dealer score: " + @model.get('dealerHand').scores()
    console.log('king o de blackjack hill')
