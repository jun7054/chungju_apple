import 'package:flutter/material.dart';

class TodoLocalPage extends StatefulWidget {
  const TodoLocalPage({super.key});

  @override
  State<TodoLocalPage> createState() => _TodoLocalPageState();
}

class _TodoLocalPageState extends State<TodoLocalPage> {

  final TextEditingController _controller = TextEditingController();
  final List<String> _todos = [];
  void _addTodo(){
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _todos.add(text);
        _controller.clear();
      });
    }
  }
  
  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todos', _todos);
  }

  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final savedList = prefs.getStringList("todos") ?? [];
    setState(() {
      _todos.addAll(savedList);
    });
  }

  void _deleteTodo(int index){
    final deleted = _todos[index];
    setState(() {
      _todos.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("'$deleted' 삭제됨"),)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("로컬 To-Do"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (_) => _addTodo(),
                      decoration: const InputDecoration(
                          hintText: "할 일을 입력하세요",
                          border: OutlineInputBorder()
                      ),
                    )
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _addTodo,
                    child: const Text("추가")
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text(_todos[index]),
                    onLongPress: () => _deleteTodo(index),
                  );
                },
              )
          )
        ],
      ),
    );
  }
}

class SharedPreferences {
  static getInstance() {}
}