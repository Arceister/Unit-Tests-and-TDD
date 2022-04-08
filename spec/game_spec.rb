require 'game'

describe 'Game' do
  describe '#match_word' do
    it 'should handle all incorrect letters well' do
      game = Game.new('DRINK')
      guess_word = 'HELLO'

      result = game.match_word(guess_word)

      expect(result).to eq("\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}")
    end
  end
end