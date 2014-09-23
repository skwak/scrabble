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
    array_of_words.max_by { |word| score(word)}
  end

  # def self.find_array_of_scores(array_of_words)
  #   @scores_array = []
  #   array_of_words.each { |word| @scores_array << score(word) }
  #   @scores_array
  # end

  def self.tied_score(array_of_words)
    array_of_words.each { |word| word if score(word).length < score(word).length}
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
