require_relative 'config/environment'
require_relative 'models/textanalyzer.rb'

class App < Sinatra::Base

get '/' do
  erb :index
end

post '/' do # expecting '/results' instead of writing over '/'
  text_from_user = params[:user_text]
  # Create an instance of the class. Like taking a recipe and actually putting the ingredients together and actually cooking.
  # We have one ingredient: text_from_user, and multiple methods like #sauteeing, #boiling, #chopping, etc.
  # So, pass in the user's text as an argument to the model's class definition.
  @analyzed_text = TextAnalyzer.new(text_from_user)
  # Later you can directly plug in params[:user_text] as the argument
  erb :results
end


end
