require 'sinatra/base'
require 'sinatra/flash'
require './lib/hangperson_game.rb'

class HangpersonApp < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  
  before do
    @game = session[:game] || HangpersonGame.new('')
  end
  
  after do
    session[:game] = @game
  end

	get '/' do
	  redirect '/new'
	end

	get '/new' do
	  @title = 'New game'
	  erb :new
	end
 
	post '/create' do
		# NOTE: don't change next line - it's needed by autograder!
		word = params[:word] || HangpersonGame.get_random_word
		# NOTE: don't change previous line - it's needed by autograder!

		@game = HangpersonGame.new(word)
		redirect '/show'
	end 

	get '/show' do
		erb :show
	end

	post '/guess' do
	  @game.guess params[:guess]
	  case @game.check_win_or_lose
	  when :play
		erb :show
	  when :win
		redirect '/win'
	  when :lose
		redirect '/lose'
	  end
	end 

	get '/lose' do
	  erb :lose
	end

	get '/win' do
	  erb :win
	end
	run! if __FILE__ == $0
  
end
