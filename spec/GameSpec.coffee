assert = chai.assert
expect = chai.expect
should = chai.should()

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

  describe 'checkPlayerScore', ->
    before ->
      Card1 = new Card {rank: 1, suit: 'Spades'}
      Card2 = new Card {rank: 0, suit: 'Spades'}
      deck = new Deck()
      dealerHand = deck.dealDealer()
      playerHand = new Hand [Card1, Card2], @, false
      game = new Game {playerHand: playerHand, dealerHand: dealerHand}
    it 'should end game on player Blackjack', ->
      assert.strictEqual playerHand.scores()[1], 21
      assert.strictEqual game.get('isRunning'), false
    it 'should result in player victory on Blackjack', ->
      assert.strictEqual playerHand, game.get('winner')

  describe 'checkDealerScore', ->
    before ->
      deck = new Deck()
      dealerHand = deck.dealDealer()
      playerHand = deck.dealPlayer()
      game = new Game {playerHand: playerHand, dealerHand: dealerHand}
    it 'should call dealerTurn on player stand', ->
      game.get('playerHand').stand()
      spy = chai.spy(game.dealerTurn)
      expect(spy).to.have.been.called
    it 'should result in a dealer score greater than 16', ->
      assert.isTrue game.get('dealerHand').scores()[1] > 16
