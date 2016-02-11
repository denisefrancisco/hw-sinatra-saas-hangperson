class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
  end
  
  def guess(s)
    @guesses = ''
    @wrong_guesses = ''
    if s.length > 1 then
      new_s = s.split(//)
      new_s.each do |x|
        guess(x)
      end
    else
      print new_s
      if @word.include? s then
        @guesses += s
      else
        @wrong_guesses += s
      end
    return true
    end
    
  end
    

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
