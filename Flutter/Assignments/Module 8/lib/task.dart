import 'package:flutter/material.dart';


class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> _tasks = [];

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      _tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final task = _tasks[index];

          return ListTile(
            title: Text(task.title),
            subtitle: Text(task.description),
            trailing: Text(task.deadline),
            onLongPress: () {
              _showTaskDetailsBottomSheet(context, task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String description = '';
        String deadline = '';

        return AlertDialog(
          title: Text('Add Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title', hintText: "Title",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 20,
                        )
                    )),
                onChanged: (value) {
                  title = value;
                },
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please enter the title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 3,),
              TextFormField(
                maxLines: 6,

                decoration: InputDecoration(labelText: 'Description', hintText: "Description",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 20,
                        )

                    )


                ),

                onChanged: (value) {
                  description = value;
                },
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please enter the description';
                  }
                  return null;

                },

              ),
              SizedBox(height: 3,),
              TextFormField(

                decoration: InputDecoration(labelText: 'Deadline', hintText: "Deadline",

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.amber,
                          width: 20,
                        )
                    )
                ),

                onChanged: (value) {
                  deadline = value;
                },
                validator: (value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Please enter the deadline';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_addTaskFormValidator(title, description, deadline)) {
                  Task newTask = Task(title, description, deadline);
                  _addTask(newTask);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  bool _addTaskFormValidator(
      String title,
      String description,
      String deadline,
      ) {
    if (title.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Empty'),
            content: Text('Please enter the title'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }

    if (description.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Empty'),
            content: Text('Please enter the description'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }

    if (deadline.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Empty'),
            content: Text('Please enter the deadline'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return false;
    }

    return true;
  }

  void _showTaskDetailsBottomSheet(BuildContext context, Task task) {
    showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Task Details',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Title: ${task.title}'),
              Text('Description: ${task.description}'),
              Text('Deadline: ${task.deadline}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _deleteTask(task);
                  Navigator.of(context).pop();
                },
                child: Text('Delete Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Task {
  final String title;
  final String description;
  final String deadline;

  Task(this.title, this.description, this.deadline);
}

