require 'uri'
require 'net/http'

class Game
  def initialize(secret_word)
    @secret_word = secret_word
  end

  def match_word(guess_word)
    result = "\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}\u{1F7E6}"

    link = "https://api.dictionaryapi.dev/api/v2/entries/en/#{guess_word.downcase}"
    uri = URI(link)
    response = Net::HTTP.get_response(uri)

    if (response.is_a?(Net::HTTPSuccess))
      guess_word.split('').each_with_index do |letter, index|
        if @secret_word[index] == letter
          result[index] = "\u{1F7E9}"
        elsif @secret_word.include?(letter)
          result[index] = "\u{1F7E8}"
        end
      end
    else
      result = "Not a valid English word!"
    end

    result
  end
end