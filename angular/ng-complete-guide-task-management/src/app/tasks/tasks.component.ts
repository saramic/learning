import { Component, Input } from '@angular/core';
import { TaskComponent } from './task/task.component';
import { NewTaskComponent } from './new-task/new-task.component';
import { TasksService } from './tasks.service';

@Component({
  selector: 'app-tasks',
  standalone: true,
  imports: [TaskComponent, NewTaskComponent],
  templateUrl: './tasks.component.html',
  styleUrl: './tasks.component.css',
})
export class TasksComponent {
  @Input({ required: true }) userId!: string;
  @Input({ required: true }) name!: string;
  isAddingTask = false;
  // NOTE: not recommended as creates a new instance of the service, use
  // constructor instead
  // private tasksService = new TasksService();

  constructor(private tasksService: TasksService) {}
  // NOTE: alternative to above
  // constructor(tasksService: TasksService) {
  //   this.tasksService = tasksService;
  // }

  get selectedUserTasks() {
    return this.tasksService.getUserTasks(this.userId);
  }

  onCompleteTask(id: string) {
  }

  onStartAddTask() {
    this.isAddingTask = true;
  }
  onCancelAddTask() {
    this.isAddingTask = false;
  }
  onAddTask(taskData: { title: string; summary: string; date: string }) {
    this.isAddingTask = false;
  }
}
