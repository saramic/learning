class Tennis
  def initialize
    @player_one_count = 0
    @player_two_count = 0
  end

  def score
    return "deuce" if deuce?
    return "advantage server" if advantage_server?
    return "advantage receiver" if advantage_receiver?
    return "game server" if game_server?
    return "game receiver" if game_receiver?

    if same_score?
      score_converter[@player_one_count] + ' all'
    else
      score_converter[@player_one_count] + ' ' + score_converter[@player_two_count]
    end
  end

  def player_one_scores
    @player_one_count += 1
  end

  def player_two_scores
    @player_two_count += 1
  end

  private

  def advantage_server?
    @player_one_count == @player_two_count + 1 &&
        @player_two_count >= 3
  end

  def advantage_receiver?
    @player_one_count + 1 == @player_two_count &&
        @player_one_count >= 3
  end

  def game_server?
    @player_one_count == @player_two_count + 2 &&
        @player_two_count >= 3
  end

  def game_receiver?
    @player_one_count + 2 == @player_two_count &&
        @player_one_count >= 3
  end

  def score_converter
    {0 => 'love', 1 => '15', 2 => '30', 3 => '40'}
  end

  def same_score?
    @player_one_count == @player_two_count
  end

  def deuce?
    same_score? && @player_one_count >= 3
  end
end
