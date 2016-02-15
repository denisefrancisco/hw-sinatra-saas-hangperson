class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  attr_accessor :word
  attr_accessor :guesses
  attr_accessor :wrong_guesses
  attr_accessor :displayed
  
  def initialize(word)
    @word = word
    @guesses = ''
    @wrong_guesses = ''
    @displayed = ''
  end
  
  def length
    return @word.length
  end
  
  def guess(s)
    if (/\A[a-zA-Z]\Z/ =~ s) == 0 then 
      s = s.downcase
      if @wrong_guesses.include? s or @guesses.include? s then
        return false
      elsif @word.include? s then
        @guesses += s
        word_with_guesses
        return true
      else
        @wrong_guesses += s
      end
      return false
    else
      raise ArgumentError
    end
  end
    
  def guess_several_letters(letters)
    new_list = letters.split(//)
    new_list.each do |x|
      guess(x)
    end
  end
  
  def word_with_guesses
    new_word = ""
    word_asList = @word.split(//)
    word_asList.each { |letter|
      if @guesses.include? letter then
        new_word += letter
      else
        new_word += "-"
      end
    }
    @displayed = new_word
    return new_word
  end

  def check_win_or_lose
    if @wrong_guesses.length >= 7 and word_with_guesses != @word then
      return :lose
    elsif @word == word_with_guesses and @wrong_guesses.length <= 7 then 
      return :win
    else
      return :play
    end
  end
  
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
=begin
game1 = HangpersonGame.new("foobar")
game1.guess("o")
puts game1.displayed
puts game1.word_with_guesses
=end

end
