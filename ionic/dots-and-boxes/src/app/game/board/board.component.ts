import { CommonModule } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { IonContent, IonGrid, IonRow, IonCol } from '@ionic/angular/standalone';

@Component({
  selector: 'app-board',
  standalone: true,
  templateUrl: './board.component.html',
  styleUrls: ['./board.component.scss'],
  imports: [CommonModule, IonContent, IonGrid, IonRow, IonCol],
})
export class BoardComponent implements OnInit {
  colorOff = '#cfcfcf';
  colorOnOne = 'red';
  colorOnTwo = 'blue';
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
      };
      return cell;
    })
  );

  constructor() {}

  ngOnInit() {}

  onCellClick(i: number, j: number, k: string) {
    // console.log('Cell clicked');
    // console.log(i, j, k);
    this.board[i][j][k] = this.turn ? this.colorOnOne : this.colorOnTwo;
    this.turn = !this.turn;
  }
}
