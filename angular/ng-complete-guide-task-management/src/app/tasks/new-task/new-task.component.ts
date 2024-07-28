import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-new-task',
  standalone: true,
  imports: [],
  templateUrl: './new-task.component.html',
  styleUrl: './new-task.component.css',
})
export class NewTaskComponent {
  @Output() cancel = new EventEmitter<void>();

  onSubmit(event: any) {
    console.log('form submitted');
    console.log('form submitted', event);
  }
  onCancel() {
    this.cancel.emit();
  }
}
