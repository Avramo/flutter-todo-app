import 'package:flutter/foundation.dart';
import 'package:todo_app/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskTitle: 'Buy milk'),
    Task(taskTitle: 'Call home'),
    Task(taskTitle: 'Fix leak'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasksView {
    return UnmodifiableListView(_tasks);
  }

  void addTask({@required String title}) {
    _tasks.add(Task(taskTitle: title));
    notifyListeners();
  }

  void toggleDone(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }
}
