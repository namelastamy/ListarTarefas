import 'package:flutter/material.dart';

class Task {
  final String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  List<Task> tasks = [];

  void addTask(String taskName) {
    setState(() {
      tasks.add(Task(name: taskName));
    });
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) => CheckboxListTile(
          value: tasks[index].isCompleted,
          title: Text(tasks[index].name),
          onChanged: (_) => toggleTaskStatus(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTaskDialog(addTask),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddTaskDialog extends StatefulWidget {
  final Function(String) onTaskAdded;

  AddTaskDialog(this.onTaskAdded);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TextEditingController taskNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Tarefa'),
      content: TextField(
        controller: taskNameController,
        decoration: InputDecoration(labelText: 'Nome da Tarefa'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onTaskAdded(taskNameController.text);
            Navigator.of(context).pop();
          },
          child: Text('Adicionar'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
      ],
    );
  }
}