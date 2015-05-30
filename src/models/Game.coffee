class window.Game extends Backbone.Model
  initialize: (params) ->
    @set('playerHand', params.playerHand)
    @set('dealerHand', params.dealerHand)
    @set('isRunning', true)

    # @checkScores(@get('playerHand'))
    # # change in hands?
    # @get('playerHand').on('change add', ->
    #   @checkScores(@get('playerHand'))
    # ,@)

    @get('playerHand').on('stand', ->
      @dealerTurn(@get('dealerHand'))
    ,@)

    # @get('dealerHand').on('change add', ->
    #   @checkScores(@get('dealerHand'))
    # ,@)

    @checkPlayerScore();
    @get('playerHand').on('add', ->
      @checkPlayerScore()
    , @)

    @get('dealerHand').on('add', ->
      @checkDealerScore()
    ,@)

    @on('change:isRunning', ->
      console.log('game state changed!')
    ,@)

    #@checkScores(params.dealerHand)
    #@checkScores(@get('playerHand'))

  checkPlayerScore: ->
    if ((@get('playerHand').scores()[1] == 21) && @get('isRunning')) then @endGame(@get('playerHand'))
    if ((@get('playerHand').scores()[0] > 21) && @get('isRunning')) then @endGame(@get('dealerHand'))

  checkDealerScore: ->
    if ((@get('dealerHand').scores()[1] == 21) && @get('isRunning')) then @endGame(@get('dealerHand'))
    if ((@get('dealerHand').scores()[0] > 21) && @get('isRunning')) then @endGame(@get('playerHand'))

  # checkScores: (hand) ->
  #   console.log(@get('playerHand'))
  #   console.log(@get('dealerHand'))
  #   if hand.get('isDealer')
  #     opponent = @get('playerHand')
  #     console.log('opponent set to player')
  #   else
  #     opponent = @get('dealerHand')
  #     console.log('opponent set to dealer')
  #     # if !(@get('isRunning'))
  #     #   console.log('opponent: ' + JSON.stringify(opponent))
  #   #Blackjack!
    # if ((hand.scores()[1] == 21) && @get('isRunning')) then @endGame(hand)
    # if ((hand.scores()[0] > 21) && @get('isRunning'))
  #     debugger
  #     @endGame(opponent)

  dealerTurn: ->
    @get('dealerHand').at(0).flip()
    while @get('dealerHand').scores()[0] < 17
      @get('dealerHand').hit()
    if @get('isRunning')
      if @get('dealerHand').scores()[1] < @get('playerHand').scores()[1] then @endGame(@get('playerHand'))
      else @endGame(@get('dealerHand'))

  endGame: (winner) ->
    @set('isRunning', false)
    console.log(winner)







