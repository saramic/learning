import { Component, EventEmitter, Output, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-new-task',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './new-task.component.html',
  styleUrl: './new-task.component.css',
})
export class NewTaskComponent {
  @Output() cancel = new EventEmitter<void>();
  enteredTitle = signal('');
  enteredSummary = signal('');
  enteredDate = signal('');

  onSubmit(event: any) {
    console.log('form submitted');
    console.log('form submitted', event);
  }
  onCancel() {
    this.cancel.emit();
  }
}
