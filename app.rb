require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'


class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])

    erb :results
  end
end
