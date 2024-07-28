import { Component } from '@angular/core';

@Component({
  selector: 'app-new-task',
  standalone: true,
  imports: [],
  templateUrl: './new-task.component.html',
  styleUrl: './new-task.component.css',
})
export class NewTaskComponent {
  onSubmit(event: any) {
    console.log('form submitted');
    console.log('form submitted', event);
  }
}
