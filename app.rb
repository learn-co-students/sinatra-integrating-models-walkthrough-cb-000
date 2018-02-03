require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    text_analyzer = TextAnalyzer.new(text_from_user)

    @counts = text_analyzer.get_counts
    @winner = text_analyzer.winner_letter

    erb :results
  end
end
