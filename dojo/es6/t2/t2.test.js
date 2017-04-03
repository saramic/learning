import T2 from './t2';

[
  [0, 0, 'love all'],
  [1, 0, '15 love'],
  [2, 0, '30 love'],
  [3, 0, '40 love'],
  [4, 0, 'game player 1'],
  [0, 4, 'game player 2'],
  [0, 1, 'love 15'],
  [0, 2, 'love 30'],
  [0, 3, 'love 40'],
  [2, 3, '30 40'],
  [3, 3, 'deuce'],
  [4, 3, 'advantage player 1'],
  [4, 4, 'deuce'],
  [4, 5, 'advantage player 2'],
  [4, 6, 'game player 2'],
].forEach( ([p1, p2, score]) => {
  test(`p1 ${p1} p2 ${p2} score is ${score}`, () => {
    const t2Inst = new T2;
    [...Array(p1)].forEach(x => t2Inst.p1scores());
    [...Array(p2)].forEach(x => t2Inst.p2scores());
    expect(t2Inst.score()).toEqual(score);
  });
})
