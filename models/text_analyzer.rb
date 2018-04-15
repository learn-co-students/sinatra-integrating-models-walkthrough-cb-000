class TextAnalyzer
  attr_reader :test

  def initialize(text)
    @text = text.downcase
  end

  def count_of_words
    words = text.split(' ')
    words.count
  end

  def count_of_vowels
    text.scan(/[aeiou]/).count
  end

  def count_of_constants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    lettersArr = text.gsub(/[^a-z|A-Z]/, '').split('')
    hash = {}
    lettersArr.each {|l| hash[l] = lettersArr.count(l)}
    hash = hash.sort_by{|k,v| v}.to_h
    {hash.keys.last=>hash.values.last}
  end

end
