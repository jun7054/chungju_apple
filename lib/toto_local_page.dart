import 'package:flutter/material.dart';

class  TodoLocalPage extends StatefulWidget {
  const TodoLocalPage ({super.key});

  @override
  State<TodoLocalPage> createState() => _TodoLocalPageState();
}

class _TodoLocalPageState extends State<TodoLocalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("로컬 To-DO"),
        ),
        body: const Center(
          child: Text(
            "여기에 로컬 ToDo 기능이 들어갈 겁니다.",
            style: TextStyle(fontSize: 18),
          ),
        )
    );
  }
}