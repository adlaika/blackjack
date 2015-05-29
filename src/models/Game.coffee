class window.Game extends Backbone.Model
  initialize: (params) ->
    @checkScores(params.playerHand)
    # change in hands?
    params.playerHand.on('change add', ->
      console.log('changed!')
      @checkScores(params.playerHand)
    ,@)

    params.playerHand.on('stand', ->
      console.log('triggerrd')
      @dealerTurn(params.dealerHand)
    ,@)

    params.dealerHand.on('change add', ->
      console.log('changed!')
      @checkScores(params.dealerHand)
    ,@)

    #@checkScores(params.dealerHand)
    #@checkScores(params.playerHand)


  checkScores: (hand) ->
    name = if !hand.isDealer then 'Player' else 'Dealer'
    # does dealer or player have 21?
    if hand.scores()[1] == 21 then alert(name + ' wins!')
    if hand.scores()[0] > 21 then alert(name + ' busted!')

  dealerTurn: (dealerHand) ->
    dealerHand.at(0).flip()
    while dealerHand.scores()[0] < 17
      dealerHand.hit()






