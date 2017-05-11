require_relative 'config/environment'
require_relative 'models/textanalyzer.rb'

class App < Sinatra::Base

get '/' do
  erb :index
end

post '/' do
  text_from_user = params[:user_text]
  @analyzed_text = TextAnalyzer.new(text_from_user)
  @word_count = @analyzed_text.count_of_words
  @vowel_count = @analyzed_text.count_of_vowels
  @non_vowel_count = @analyzed_text.count_of_consonants
  @most_used_letter = @analyzed_text.most_used_letter
   @most_used_letter[0] = @most_used_letter[0].upcase
  erb :results
end


end
