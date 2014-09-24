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

  def highest_word_score
    Scrabble.score(highest_scoring_word)
  end

  def total_score
    sum=0
    @plays.each { |word| sum+=Scrabble.score(word)}
    sum
  end

  def won?
    if total_score > 100
      true
    else
      false
    end
  end

end
