require 'game'

describe 'Game' do
  describe '#match_word' do
    it 'should handle all incorrect letters well' do
      game = Game.new('DRINK')
      guess_word = 'HELLO'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}")
    end

    # One additional spec for new scenario: wrongly positioned letter
    it 'should handle a wrongly positioned letter well' do
      # Given a game object with secret_word 'DRINK'
      # and guess_word 'CLEAN' (N is a correct letter but in wrong position)
      game = Game.new('DRINK')
      guess_word = 'CLEAN'

      # When we try to match the guess word
      result = game.match_word(guess_word)

      # Then it should return "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E8}"
      # which is the ASCII code for 🟦🟦🟦🟦🟨
      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E8}")
    end
  end
end