import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController _controller = TextEditingController();
  List<Task> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // Text color in the app bar
        title: Center(child: Text('YOUR TASKS')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              style: TextStyle(
                  color: Colors.white), // Text color for the input field
              decoration: InputDecoration(
                labelText: 'Add a new task',
                labelStyle: TextStyle(
                    color: Colors.white), // Text color for the input label
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String taskName = _controller.text;
                  if (taskName.isNotEmpty) {
                    _tasks.add(Task(name: taskName));
                    _controller.clear();
                  }
                });
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Add Task',
                  style: TextStyle(
                      color: Colors.white)), // Text color for the button
            ),
            SizedBox(height: 20),
            Text(
              'Tasks:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      _tasks[index].name,
                      style: TextStyle(
                          color: Colors.white), // Text color for the task name
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _tasks.removeAt(index);
                            });
                          },
                        ),
                        Checkbox(
                          value: _tasks[index].isDone,
                          onChanged: (value) {
                            setState(() {
                              _tasks[index].isDone = value ?? false;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}