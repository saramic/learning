import { Injectable } from "@angular/core";
import { NewTaskData } from "./task/task.model";

// NOTE: providedIn: 'root' is a shorthand for providing the service in the root
// injector - different instances will work with the same instance of the
// service as it is injected at the root
@Injectable({providedIn: 'root'})
export class TasksService {
  private tasks = [
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

  getUserTasks(userId: string) {
    return this.tasks.filter((task) => task.userId === userId);
  }

  addTask(taskData: NewTaskData, userId: string) {
    // NOTE: could use this.tasks.unsift or .push
    this.tasks = [
      {
        ...taskData,
        ...{
          id: `t${this.tasks.length.toString()}`, // OR new Date().getTime().toString(),
          userId: userId,
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
  }

  removeTask(id: string) {
    this.tasks = this.tasks.filter((task) => task.id !== id);
  }

  completeTask(id: string) {
    this.removeTask(id);
  }
}