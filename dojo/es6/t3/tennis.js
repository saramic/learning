const SCORES = {
  0: 'love',
  1: 15,
  2: 30,
  3: 40,
}

class Tennis {
  constructor() {
    this.scores = {
      1: 0,
      2: 0,
    };
  }

  isSameScore() {
    return this.min() === this.max();
  }

  scoreDiff(number) {
    return this.max() - this.min();
  }

  isAdvantage() {
    return !this.isSameScore()
      && this.max() > 3
      && this.scoreDiff() === 1;
  }

  isDeuce() {
    return this.isSameScore() && this.max() >= 3;
  }

  statusText(status) {
    return `${status} player ${this.whoIsWinning()}`;
  }

  whoIsWinning(){
    const max = this.max();
    return this.keys().find((x) => this.scores[x] == max);
  }

  advantageText() {
    if (this.isAdvantage()) return this.statusText('advantage');
  }

  max() {
    return Math.max.apply(null, this.vals());
  }

  min() {
    return Math.min.apply(null, this.vals());
  }

  keys() {
    return Object.keys(this.scores).map((x) => parseInt(x));
  }

  vals() {
    return this.keys().map((x) => this.scores[x]);
  }

  isWinner() {
    return this.max() - this.min() >= 2 && this.max() >= 4
  }

  gameText() {
    if (this.isWinner()) return this.statusText('game');
  }

  deuceText() {
    if (this.isDeuce()) return 'deuce';
  }

  standardScore() {
    let scores = this.keys().map((x) => SCORES[this.scores[x]]);
    if (this.isSameScore()) {
      scores = Array.from(new Set(scores));
      scores = scores.concat(['all']);
    }
    return scores.join(" ")
  }

  score() {
    return this.gameText()
    || this.advantageText()
    || this.deuceText()
    || this.standardScore()
  }

  playerScores(player) {
    if (!this.scores[player]) this.scores[player] = 0;
    this.scores[player]++;
  }
}

export default Tennis;
