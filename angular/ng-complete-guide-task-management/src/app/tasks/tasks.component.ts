import { Component, Input } from '@angular/core';
import { TaskComponent } from './task/task.component';
import { NewTaskComponent } from './new-task/new-task.component';

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
  tasks = [
    {
      id: 't1',
      userId: 'u1',
      title: 'Master Angular',
      summary: 'Learn all the basics and advanced features',
      dueDate: '2025-12-31',
    },
    {
      id: 't2',
      userId: 'u3',
      title: 'Build first prototype',
      summary: 'Learn all the basics and advanced features',
      dueDate: '2025-12-31',
    },
  ];
  isAddingTask = false;

  get selectedUserTasks() {
    return this.tasks.filter((task) => task.userId === this.userId);
  }

  onCompleteTask(id: string) {
    this.tasks = this.tasks.filter((task) => task.id !== id);
  }

  onStartAddTask() {
    this.isAddingTask = true;
  }
  onCancelAddTask() {
    this.isAddingTask = false;
  }
  onAddTask(taskData: { title: string; summary: string; date: string }) {
    // NOTE: could use this.tasks.unsift or .push
    this.tasks = [
      {
        ...taskData,
        ...{
          id: `t${this.tasks.length.toString()}`, // OR new Date().getTime().toString(),
          userId: this.userId,
          dueDate: taskData.date, // TODO: as switching? has to be a date as dueDate?
        },
      },
      ...this.tasks,
    ];
    // NOTE: alternative using unnshift below
    // this.tasks.unshift(
    //   {
    //     id: `t${this.tasks.length.toString()}`, // OR new Date().getTime().toString(),
    //     userId: this.userId,
    //     title: taskData.title,
    //     summary: taskData.summary,
    //     dueDate: taskData.date, // TODO: as switching? has to be a date as dueDate?
    //   },
    // )
    this.isAddingTask = false;
  }
}
