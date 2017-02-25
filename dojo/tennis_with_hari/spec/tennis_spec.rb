require 'tennis'

describe Tennis do
  let(:tennis) { Tennis.new }

  [
    [0, 0, 'love all'],
    [1, 0, '15 love'],
    [2, 0, '30 love'],
    [3, 0, '40 love'],
    [4, 0, 'game player 1'],
    [0, 4, 'game player 2'],
    [0, 1, 'love 15'],
    [2, 1, '30 15'],
    [1, 2, '15 30'],
    [3, 3, 'deuce'],
    [4, 3, 'advantage player 1'],
    [3, 4, 'advantage player 2'],
    [4, 4, 'deuce'],
    [5, 3, 'game player 1']
  ].each do |p1, p2, output|
    it "players score: #{p1} and #{p2} - #{output.inspect}" do
      p1.times { tennis.player1_scores }
      p2.times { tennis.player2_scores }
      expect(tennis.score).to eql output
    end
  end
end
