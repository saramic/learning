require 'tennis'

describe Tennis do
  [
      { p1: 0, p2: 0, score: 'love all'},
      { p1: 1, p2: 0, score: '15 love'},
      { p1: 2, p2: 0, score: '30 love'},
      { p1: 2, p2: 1, score: '30 15'},
      { p1: 1, p2: 1, score: '15 all'},
      { p1: 3, p2: 3, score: 'deuce'},
      { p1: 3, p2: 4, score: 'advantage receiver'},
      { p1: 4, p2: 4, score: 'deuce'},
      { p1: 5, p2: 4, score: 'advantage server'},
      { p1: 6, p2: 4, score: 'game server'},
      { p1: 4, p2: 6, score: 'game receiver'},
  ].each do |args|
    it "p1 wins #{args[:p1]} and p2 wins #{args[:p2]} then score is #{args[:score]}" do
      tennis = Tennis.new
      args[:p1].times { tennis.player_one_scores }
      args[:p2].times { tennis.player_two_scores }
      expect(tennis.score).to eq args[:score]
    end
  end
end
