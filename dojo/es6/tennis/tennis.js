const SCORES = {1: 15, 2: 30, 3: 40};

export default tennis => ({
  winningScore(a, b) {
    return a >= 4 || b >= 4;
  },
  leadingPlayer(a, b) {
    return a > b ? 1 : 2;
  },
  score(a, b) {
    if(this.winningScore(a, b)) { return `game player ${this.leadingPlayer(a, b)}` };
    return a == 0 ? 'love all' : `${SCORES[a]} love`
  }
})

