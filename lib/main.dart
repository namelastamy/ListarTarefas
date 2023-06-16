import 'package:flutter/material.dart';
import 'task_list.dart';

void main() {
  runApp(TaskListApp());
}

class TaskListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskListScreen(),
    );
  }
}