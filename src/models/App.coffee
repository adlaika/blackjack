class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'gameLogic', game = new Game({dealerHand: @get('dealerHand'), playerHand: @get('playerHand')})

