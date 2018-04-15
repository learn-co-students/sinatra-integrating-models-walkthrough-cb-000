require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])

    @letter = @analyzed_text.most_used_letter.map{|k,v| k}.join
    @times_used = @analyzed_text.most_used_letter.map{|k,v| v}.join

    erb :results
  end
end
