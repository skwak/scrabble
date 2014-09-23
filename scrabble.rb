# Minimum 8 specs
#
# Scrabble class
#
# self.score(word) returns the total score value for the given word (case insensitive)
# self.highest_score_from(array_of_words) returns the word in the array with the
# highest score.
# Note that it’s better to use fewer tiles, so if the top score is tied between
#  multiple words, pick the one with the fewest letters.
# But there is a bonus for using all seven letters. If one of the highest scores
#  uses all seven letters, pick that one
# But if the there are multiple words that are the same score and same length,
# pick the first one in supplied list

# #A, E, I, O, U, L, N, R, S, T	1
# D, G	2
# B, C, M, P	3
# F, H, V, W, Y	4
# K	5
# J, X	8
# Q, Z	10


class Scrabble
  attr_accessor :word

  def self.score(word)
    array_of_values(word)
    @num_array.inject { |sum, item| sum + item}
  end

  def self.highest_score_from(array_of_words)
    find_top_word = array_of_words[0]
    array_of_words.each do |word|
      if score(word) > score(find_top_word)
        find_top_word = word
      elsif score(word) == score(find_top_word)
        find_top_word = tied_score(word, find_top_word)
      else
        find_top_word
      end
    end

    find_top_word

    # top_array = array_of_words.find_all { |word| score(word) == highest_score}
    # top_array.sort.last
    # if (top_array.length = 2)
    #   top_array.find { |word| word if tied_score(word, highest_score_word)}
    # else
    #   top_array[0]
    # end
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
