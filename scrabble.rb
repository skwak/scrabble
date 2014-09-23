class Scrabble
  attr_accessor :word

  def self.score(word)
    array_of_values(word)
    @num_array.inject { |sum, item| sum + item}
  end

  def self.highest_score_from(array_of_words)
    find_highest_word = array_of_words[0]
    array_of_words.each do |word|
      if score(word) > score(find_highest_word)
        find_highest_word = word
      elsif score(word) == score(find_highest_word)
        find_highest_word = tied_score(word, find_highest_word)
      else
        find_highest_word
      end
    end
    find_highest_word
  end

  def self.tied_score(word, another_word)
    if (score(word) == score(another_word)) && (word.length <
      another_word.length) && (word.length != 7) && (another_word.length != 7)
      word
    elsif (word.length == 7) || (another_word.length == 7)
      bonus_seven
    else
      another_word
    end
  end

  def self.bonus_seven(word, another_word)
    if (score(word) == score(another_word)) && (word.length == 7)
      word
    else
      another_word
    end
  end

  def self.word_array(word)
    @word = word
    word.downcase.split(//)
  end

  def self.array_of_values(word)
    @num_array = []
    word_array(word).each do |letter|
      if letter == "a" || letter == "e" || letter == "i" || letter == "o" ||
      letter == "u" || letter == "l" || letter == "n" ||
      letter == "r" || letter == "s" || letter == "t"
        @num_array << 1
      elsif letter == "d" || letter == "g"
        @num_array << 2
      elsif letter == "b" || letter == "c" || letter == "m" || letter == "p"
        @num_array << 3
      elsif letter == "f" || letter == "h" || letter == "v" || letter == "w" ||
      letter == "y"
        @num_array << 4
      elsif letter == "k"
        @num_array << 5
      elsif letter == "j" || letter == "x"
        @num_array << 8
      elsif letter == "q" || letter == "z"
        @num_array << 10
      end
    end
    @num_array
  end

end
