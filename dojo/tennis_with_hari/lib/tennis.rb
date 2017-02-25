class Tennis
  SCORE = {
    0 => 'love',
    1 => 15,
    2 => 30,
    3 => 40
  }

  def initialize
    @p1 = 0
    @p2 = 0
  end

  def player1_scores
    @p1 += 1
  end

  def player2_scores
    @p2 += 1
  end

  def score
    [deuce, advantage, winning, std_score].compact.first
  end

  private

  def deuce
    "deuce" if even_score? && @p1 >=3
  end

  def advantage
    leading_player_text('advantage') if advangege_score?
  end

  def winning
    leading_player_text('game') if winning_level_score?
  end

  def advangege_score?
    winning_level_score? && (@p1 - @p2).abs == 1
  end

  def winning_level_score?
    @p1 >= 4 || @p2 >= 4
  end

  def leading_player_text(string)
    "#{string} player #{@p1 > @p2 ? 1 : 2}"
  end

  def even_score?
    @p1 == @p2
  end

  def std_score
    scores = [@p1, @p2].map{|score| SCORE[score] }.uniq
    scores << 'all' if even_score?
    scores.join(' ')
  end
end
