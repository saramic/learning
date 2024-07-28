import { Component, Input, output } from '@angular/core';

@Component({
  selector: 'app-user',
  standalone: true,
  imports: [],
  templateUrl: './user.component.html',
  styleUrl: './user.component.css',
})
export class UserComponent {
  @Input({ required: true }) id!: string;
  @Input({ required: true }) avatar!: string;
  @Input({ required: true }) name!: string;

  // NOTE: traditional output emitter
  // @Output() select = new EventEmitter<string>();
  // NOTE: newer output - not signals unline input, just custom emitter could
  // allow for neater no decorator approach if using input
  select = output<string>();

  // NOTE: more preformant as "only" gets called when the avatar changes
  get imagePath() {
    return 'assets/users/' + this.avatar;
  }

  onSelectUser() {
    this.select.emit(this.id)
  }
}
