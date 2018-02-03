# Your TextAnalyzer model code will go here.
class TextAnalyzer

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def get_counts
    words = @text.split(/ /).length
    vowels = @text.count 'aeiou'
    consonants = @text.tr('aeiou','').scan(/[^aeiou\s\W]/).length

    [words, vowels, consonants]
  end

  def winner_letter
    unique_letters = @text.split(//).uniq.compact
    unique_letters.delete(' ')

    letter_count = {}

    unique_letters.each do |letter|
      letter_count[letter] = @text.count letter.to_s
    end

    sorted = letter_count.sort_by { |_letter, count| count }
    sorted.last
  end


end