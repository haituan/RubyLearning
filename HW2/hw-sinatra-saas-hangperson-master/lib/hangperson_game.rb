class HangpersonGame

  attr_accessor :guesses, :wrong_guesses, :word, :letters_left, :word_left, :init
  
  def initialize(word)
    @word = word
	@word_left = String.new(word)
    @guesses = ""
    @wrong_guesses = ""
    @letters_left = word.length
  end
  
  def guess input
    if input.nil? || input.empty? || input[/[a-zA-Z]/].nil?
		raise ArgumentError
	else
		letterinput = input.downcase
		if @word_left.include? letterinput
			@guesses += letterinput 
			@size = @word_left.length - @word_left.delete!(letterinput).length
			@letters_left -= @size
			true
		else
			if @wrong_guesses.include? letterinput
				true
			else
				@wrong_guesses += letterinput
				false
			end
		end
	end
  end
  
  def word_with_guesses
	wwg = ''
	i = 0
	while i < word_left.length do
	   wwg += '#'
	   i +=1
	end
	wwg
  end



  def check_win_or_lose
    if wrong_guesses.length > 6
      :lose
    elsif letters_left == 0
      :win
    elsif letters_left > 0
      :play
    end
  end

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
