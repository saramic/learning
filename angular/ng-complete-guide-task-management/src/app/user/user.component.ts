import { Component, computed, input, Input } from '@angular/core';

@Component({
  selector: 'app-user',
  standalone: true,
  imports: [],
  templateUrl: './user.component.html',
  styleUrl: './user.component.css',
})
export class UserComponent {
  // NOTE: decorator approach
  // @Input({ required: true }) avatar!: string;
  // @Input({ required: true }) name!: string;
  // NOTE: signal approach
  avatar = input.required<string>();
  name = input.required<string>();

  // NOTE: more preformant as "only" gets called when the avatar changes
  imagePath = computed(() => 'assets/users/' + this.avatar())

  onSelectUser() {
    //   const randomIndex = Math.floor(Math.random() * DUMMY_USERS.length);
    //   this.selectedUser.set(DUMMY_USERS[randomIndex]);
  }
}
