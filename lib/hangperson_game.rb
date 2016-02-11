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
    if (/\A[a-zA-Z]\Z/ =~ s) == 0 then 
      s = s.downcase
      if wrong_guesses.include? s or guesses.include? s then
        return false
      end
      if @word.include? s then
        @guesses += s
        return true
      else
        if !(@wrong_guesses.include? s) then
          @wrong_guesses += s
        end
      end
      return false
    else
      raise ArgumentError
    end
  end
    
  def guess_several_letters(g,letters)
    new_list = letters.split(//)
    new_list.each do |x|
      guess(x)
    end
  end
    

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

end
