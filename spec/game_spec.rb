class Game
  # Now it's necessary to assign secret_word to @secret_word
  def initialize(secret_word)
    @secret_word = secret_word
  end

  def match_word(guess_word)
    result = "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"

    # Now it's necessary to properly handle a correct letter in incorrect position
    guess_word.split('').each_with_index do |letter, index|
      if @secret_word.include?(letter)
        # "\u{1F7E8}" is the ASCII code for 🟨
        result[index] = "\u{1F7E8}"
      end
    end
    
    result
  end
end