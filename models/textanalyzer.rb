class TextAnalyzer
  attr_accessor :text

  def initialize(text)
    @text = text
  end

  def count_of_words
    @text.split(" ").count
  end

  def count_of_vowels
    @text.downcase.scan(/[aeiou]/).count
  end

  def count_of_consonants
    @text.downcase.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    letters = @text.downcase.gsub(/[^a-z]/, '').split('')
    freq = letters.reduce(Hash.new(0)) do |hash, letter|
      hash.update(letter => hash[letter] + 1)
    end

    freq.sort_by{|k, v| v}.last
  end

end