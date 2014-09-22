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

  def initialize(word)
    @word = word
    @num_array = []
  end

  def self.score
    4
  end

  def word_array
    @word.downcase.split(//)
  end

  def word_points
    word_array.each do |letter|
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

  def add_array_points
    word_points
    @num_array.inject { |sum, item| sum + item}
  end

end
