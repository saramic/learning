import { Component } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HeaderComponent } from './header/header.component';
import { UserComponent } from './user/user.component';
import { DUMMY_USERS } from './dummy-users';
import { TasksComponent } from './tasks/tasks.component';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [RouterOutlet, HeaderComponent, UserComponent, TasksComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css',
})
export class AppComponent {
  title = 'ng-complete-guide-task-management';
  selectedName = '';
  users = DUMMY_USERS;

  onSelectUser(id: string) {
    console.log('Selected user:', id);
    const found = this.users.find((user) => user.id === id);
    if (found) {
      this.selectedName = found['name'];
    }
  }
}
