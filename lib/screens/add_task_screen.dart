import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.only(top: 30.0, left: 40.0, right: 40.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500),
            ),
            TextField(
              controller: _textEditingController,
              autofocus: true,
              onChanged: (newValue) {
                print(newValue);
              },
            ),
            FlatButton(
              onPressed: () {
                if (_textEditingController.text.isNotEmpty) {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(title: _textEditingController.text);
                  Navigator.pop(context);
                }
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
            )
          ],
        ),
      ),
    );
  }
}
