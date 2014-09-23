class Player
  attr_accessor :name

  def initialize(name)
    @name = name
    @plays = []
  end

  def name
    @name
  end

  def plays
    @plays
  end

  def play(word)
    @plays << word
  end

  def highest_scoring_word
    Scrabble.highest_score_from(@plays)
  end

  # def all_words_into_array(scores)
  #   scores.each { |score| @scores_array << score }
  # end
  #
  # def total_score
  #   @scores_array.inject { |sum, item| sum + item }
  # end
end
