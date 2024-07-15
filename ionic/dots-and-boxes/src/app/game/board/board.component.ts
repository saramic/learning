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
  players = [
    { name: 'Player 1', color: 'red', total: 0 },
    { name: 'Player 2', color: 'blue', total: 0 },
    { name: 'Player 3', color: 'green', total: 0 },
    { name: 'Player 4', color: 'orange', total: 0 },
  ];
  currentTurn = 0;
  getAnotherTurn = false;
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
    if (this.board[i][j][k] !== this.colorOff) {
      return;
    }
    this.board[i][j][k] = this.players[this.currentTurn].color;

    this.checkBoxClosed(i, j, k);
    if (k === 't' && i > 0) {
      this.checkBoxClosed(i - 1, j, k);
    }
    if (k === 'l' && j > 0) {
      this.checkBoxClosed(i, j - 1, k);
    }
    if (this.getAnotherTurn) {
      this.getAnotherTurn = false;
    } else {
      this.currentTurn = (this.currentTurn + 1) % this.players.length;
    }
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
        this.score_and_turn(i, j);
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
        this.score_and_turn(i, j);
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
        this.score_and_turn(i, j);
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
        this.score_and_turn(i, j);
      }
    }
  }

  score_and_turn(i: number, j: number) {
    this.board[i][j]['fin'] = this.players[this.currentTurn].color;
    this.players[this.currentTurn].total++;
    this.getAnotherTurn = true;
  }
}
