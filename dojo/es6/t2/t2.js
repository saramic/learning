const SCORES = { 0: 'love', 1: 15, 2: 30, 3: 40 };

class T2 {
  constructor() {
    this.p1 = 0;
    this.p2 = 0;
  }
  leadingText(text) {
    return `${text} player ${this.leadingPlayer()}`;
  }
  winningText() {
    if(this.isWinner()) {
      return this.leadingText('game');
    }
  }
  advantageText() {
    if(this.isAdvantage()) {
      return this.leadingText('advantage');
    }
  }
  deuceText() {
    if(this.isDeuce()) {
      return 'deuce';
    }
  }
  standardScore() {
    if(this.p1 > 0 || this.p2 > 0) {
      return `${SCORES[this.p1]} ${SCORES[this.p2]}`;
    }
  }
  score() {
    return [
      this.winningText(),
      this.advantageText(),
      this.deuceText(),
      this.standardScore(),
      'love all',
    ].find(e => e);
  }
  p1scores() {
    this.p1++;
  }
  p2scores() {
    this.p2++;
  }
  isDeuce() {
    return this.p1 >= 3 && this.p2 >=3 && this.leadingBy(0);
  }
  leadingPlayer() {
    return this.p1 > this.p2 ? 1 : 2;
  }
  isWinner() {
    return (this.p1 >= 4 || this.p2 >=4) && this.leadingBy(2);
  }
  isAdvantage() {
    return (this.p1 >= 3 && this.p2 >= 3) && this.leadingBy(1);
  }
  leadingBy(number) {
    return Math.abs(this.p2 - this.p1) >= number;
  }
}

export default T2;
