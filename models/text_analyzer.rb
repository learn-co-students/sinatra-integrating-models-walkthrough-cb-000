class TextAnalyzer
  attr_reader :text

  def initialize(text)
    @text = text.downcase
  end
  def count_of_words
    text.split(" ").count
  end

  def count_of_vowels
    text.scan(/[aeiou]/).count
  end

  def count_of_consonants
    text.scan(/[bcdfghjklmnpqrstvwxyz]/).count
  end

  def most_used_letter
    letters = text.gsub(/[^a-z]/,"").split("")
    count = {}

    letters.map do |letter|
      count[letter] = letters.count(letter)
    end

    most_letter = { count.keys.first => count.values.first }

    count.each do |key, value|
      if value > most_letter.values.first
        most_letter = {}
        most_letter[key] = value
      end
    end

  most_letter
  end

end
