assert = chai.assert
expect = chai.expect

describe 'Game', ->
  deck = null
  hand = null
  playerHand = null
  dealerHand = null
  game = null

  beforeEach ->
    deck = new Deck()
    # playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()
    # game = new Game {playerHand: playerHand, dealerHand: dealerHand}

  describe 'player hand', ->
    it 'should have 2 cards', ->
      assert.strictEqual playerHand.length, 2

  describe 'checkPlayerScore', ->
    before ->
      Card1 = new Card {rank: 1, suit: 'Spades'}
      Card2 = new Card {rank: 0, suit: 'Spades'}
      playerHand = new Hand [Card1, Card2], @, false
      game = new Game {playerHand: playerHand, dealerHand: dealerHand}
      debugger
    it 'should end game on player Blackjack', ->
      assert.strictEqual playerHand.scores()[1], 21
      assert.strictEqual game.get('isRunning'), false
    it 'should result in player victory on Blackjack', ->
      assert.strictEqual playerHand, game.get('winner')
