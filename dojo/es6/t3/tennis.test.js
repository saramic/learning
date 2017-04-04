import Tennis from './tennis';

[
  [[], 'love all'],
  [[1], '15 love'],
  [[2], 'love 15'],
  [[1,2], '15 all'],
  [[1,1], '30 love'],
  [[2,2], 'love 30'],
  [[1,2,2,1], '30 all'],
  [[1,2,2,1,1], '40 30'],
  [[1,2,2,1,1,2], 'deuce'],
  [[1,2,2,1,1,2,1], 'advantage player 1'],
  [[1,2,2,1,1,2,1,1], 'game player 1'],
  [[1,2,2,1,1,2,1,2], 'deuce'],
  [[1,2,2,1,1,2,1,2,2], 'advantage player 2'],
  [[1,2,2,1,1,2,2,2], 'game player 2'],
  [[2,2,2,1,1,1,2], 'advantage player 2'],
  [[1,1,1,1], 'game player 1'],

  // go all out and let other players to play ;)
  [[3,3,3,3], 'game player 3'],
  [[1,2,3], '15 all'],
  [[1,2,2,3,3,3], '15 30 40'],
  [[1,1,2,2,3,3,3], '30 30 40'],
  [[1,1,1,2,2,2,3,3,3], 'deuce'],
  [[1,2,3,4,5,6,77,77,77], '15 15 15 15 15 15 40'],
  [[1,2,3,4,5,6,77,77,77,77], 'game player 77'],

  // TODO stop the game if we have a winner
].forEach( ([playerPoints, score]) => {
  test(`player ${playerPoints} scores then score: "${score}"`, () => {
    const tennis = new Tennis();
    playerPoints.forEach((player) => {
      tennis.playerScores(player);
    });
    expect(tennis.score()).toEqual(score);
  });
})
