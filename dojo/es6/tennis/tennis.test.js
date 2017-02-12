import tennis from './tennis';

([
  [0, 0, 'love all'],
  [1, 0, '15 love'],
  [2, 0, '30 love'],
  [3, 0, '40 love'],
  [4, 0, 'game player 1'],
  [0, 4, 'game player 2'],
]).forEach(([p1, p2, score]) => {
  test(`player 1 ${p1} player 2 ${p2} score ${score}`, () => {
    const tennisGame = new tennis;
    expect(tennisGame.score(p1, p2)).toBe(score);
  });
})

