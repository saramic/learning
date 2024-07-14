import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import {
  IonContent,
  IonGrid,
  IonRow,
  IonCol,
  IonButton,
  IonIcon,
} from '@ionic/angular/standalone';
import { addIcons } from 'ionicons';
import { star } from 'ionicons/icons';

@Component({
  selector: 'app-board',
  standalone: true,
  templateUrl: './board.component.html',
  styleUrls: ['./board.component.scss'],
  imports: [
    CommonModule,
    IonButton,
    IonContent,
    IonGrid,
    IonIcon,
    IonRow,
    IonCol,
  ],
})
export class BoardComponent implements OnInit {
  colorOff = '#cfcfcf';
  colorOnOne = 'red';
  colorOnTwo = 'blue';
  playerOneTotal = 0;
  playerTwoTotal = 0;
  turn = true;
  // NOTE: cannot use new Array(10).fill(...{}) as that will create a reference
  //       to the same object, hence using a fill(null) and map to make
  //       individual objects.
  board = new Array(10).fill(null).map(() =>
    new Array(10).fill(null).map(() => {
      // NOTE: could not just return an ojbect here, had to explicitly state the
      //       type of the key is a string to look it up later on
      const cell: { [key: string]: any } = {
        t: this.colorOff,
        r: this.colorOff,
        b: this.colorOff,
        l: this.colorOff,
        fin: null,
      };
      return cell;
    })
  );

  constructor() {
    addIcons({ star });
  }

  ngOnInit() {}

  onCellClick(i: number, j: number, k: string) {
    // console.log('Cell clicked');
    // console.log(i, j, k);
    this.board[i][j][k] = this.turn ? this.colorOnOne : this.colorOnTwo;
    this.checkBoxClosed(i, j, k);
    if (k === 't' && i > 0) {
      this.checkBoxClosed(i - 1, j, k);
    }
    if (k === 'l' && j > 0) {
      this.checkBoxClosed(i, j - 1, k);
    }
    this.turn = !this.turn;
  }

  checkBoxClosed(i: number, j: number, k: string) {
    // non right bottom edge case
    if (i < this.board.length - 1 && j < this.board[i].length - 1) {
      if (
        this.board[i][j]['t'] !== this.colorOff &&
        this.board[i][j + 1]['l'] !== this.colorOff &&
        this.board[i][j]['l'] !== this.colorOff &&
        this.board[i + 1][j]['t'] !== this.colorOff
      ) {
        this.board[i][j]['fin'] = this.turn ? this.colorOnOne : this.colorOnTwo;
        this.turn ?  this.playerOneTotal++ : this.playerTwoTotal++;
        // hack to undo turn and redo turn
        this.turn = !this.turn;
      }
    }
    // right edge case
    if (i < this.board.length - 1 && j === this.board[i].length - 1) {
      if (
        this.board[i][j]['t'] !== this.colorOff &&
        this.board[i][j]['r'] !== this.colorOff &&
        this.board[i][j]['l'] !== this.colorOff &&
        this.board[i + 1][j]['t'] !== this.colorOff
      ) {
        this.board[i][j]['fin'] = this.turn ? this.colorOnOne : this.colorOnTwo;
        this.turn ?  this.playerOneTotal++ : this.playerTwoTotal++;
        // hack to undo turn and redo turn
        this.turn = !this.turn;
      }
    }
    // bottom edge case
    if (i === this.board.length - 1 && j < this.board[i].length - 1) {
      if (
        this.board[i][j]['t'] !== this.colorOff &&
        this.board[i][j + 1]['l'] !== this.colorOff &&
        this.board[i][j]['l'] !== this.colorOff &&
        this.board[i][j]['b'] !== this.colorOff
      ) {
        this.board[i][j]['fin'] = this.turn ? this.colorOnOne : this.colorOnTwo;
        this.turn ?  this.playerOneTotal++ : this.playerTwoTotal++;
        // hack to undo turn and redo turn
        this.turn = !this.turn;
      }
    }
    // bottom right
    if (i === this.board.length - 1 && j === this.board[i].length - 1) {
      if (
        this.board[i][j]['t'] !== this.colorOff &&
        this.board[i][j]['b'] !== this.colorOff &&
        this.board[i][j]['l'] !== this.colorOff &&
        this.board[i][j]['r'] !== this.colorOff
      ) {
        this.board[i][j]['fin'] = this.turn ? this.colorOnOne : this.colorOnTwo;
        this.turn ?  this.playerOneTotal++ : this.playerTwoTotal++;
        // hack to undo turn and redo turn
        this.turn = !this.turn;
      }
    }
  }
}
