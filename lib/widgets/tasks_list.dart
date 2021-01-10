import 'package:flutter/material.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/widgets/task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, builder) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasksView[index];
            return TaskTile(
                isChecked: task.isDone,
                taskTitle: task.taskTitle,
                toggleCheckboxState: (newValue) {
                  taskData.toggleDone(index);
                },
                longPressCallback: () async {
                  bool confirmed = false;
                  if (task.isDone) {
                    confirmed = await showAlertDialog(
                      context: context,
                      task: task,
                    );
                    if (confirmed) taskData.removeTask(index);
                  }

                  // taskData.removeTask(index);
                });
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }

  showAlertDialog({BuildContext context, Task task}) async {
    deleteCallBack() {
      Navigator.of(context).pop(true);
    }

    cancelCallBack() {
      Navigator.of(context).pop(false);
    }

    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: cancelCallBack,
    );

    Widget deleteButton = FlatButton(
      child: Text(
        "Delete",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: deleteCallBack,
    );

    bool result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Delete Task"),
            content: Text("Sure you want to delete this Task?"),
            actions: [
              cancelButton,
              deleteButton,
            ],
          );
        });

    return result;
  }
}
