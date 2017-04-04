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
    return this.scores[1] === this.scores[2];
  }

  scoreDiff(number) {
    return Math.abs(this.scores[1] - this.scores[2])
  }

  isAdvantage() {
    return !this.isSameScore()
      && this.scores[this.whoIsWinning()] > 3
      && this.scoreDiff() === 1;
  }

  isDeuce() {
    return this.isSameScore() && this.scores[1] >= 3;
  }

  statusText(status) {
    return `${status} player ${this.whoIsWinning()}`;
  }

  whoIsWinning(){
    return this.scores[1]>this.scores[2] ? 1 : 2;
  }

  advantageText() {
    if (this.isAdvantage()) return this.statusText('advantage');
  }

  isWinner() {
    return this.scoreDiff() >= 2
    && (this.scores[1] >= 4 || this.scores[2] >= 4);
  }

  gameText() {
    if (this.isWinner()) return this.statusText('game');
  }

  deuceText() {
    if (this.isDeuce()) return 'deuce';
  }

  standardScore() {
    let scores = [SCORES[this.scores[1]], SCORES[this.scores[2]]];
    scores = Array.from(new Set(scores));
    if (this.isSameScore()) scores = scores.concat(['all']);
    return scores.join(" ")
  }

  score() {
    return [
      this.gameText(),
      this.advantageText(),
      this.deuceText(),
      this.standardScore(),
      ].find((x) => x)
  }

  playerScores(player) {
    this.scores[player]++
  }
}

export default Tennis;
