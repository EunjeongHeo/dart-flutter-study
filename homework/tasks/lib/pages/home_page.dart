import 'package:flutter/material.dart';
import '../models/todo_entity.dart';
import '../widgets/add_todo_bottom_sheet.dart';
import '../widgets/no_todo_card.dart';
import '../widgets/todo_view.dart';
import 'todo_detail_page.dart';

class HomePage extends StatefulWidget {
final String name;
  const HomePage({super.key, required this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ToDoEntity> _todos = [];

  String get _appBarname => "${widget.name}'s Tasks"; 

  Future<void> addTodo() async {
    final result = await showModalBottomSheet<ToDoEntity>(
      context: context,
      isScrollControlled: true,
      builder: (_) => const AddTodoBottomSheet(),
    );
    if (result == null) return;
    setState(() => _todos.insert(0, result));
  }

  void _toggleDone(int index) {
    setState(() {
      final t = _todos[index];
      _todos[index] = t.copyWith(isDone: !t.isDone);
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      final t = _todos[index];
      _todos[index] = t.copyWith(isFavorite: !t.isFavorite);
    });
  }

  Future<void> _openDetail(int index) async {
    final todo = _todos[index];
    final updated = await Navigator.of(context).push<ToDoEntity>(
      MaterialPageRoute(
        builder: (_) => ToDoDetailPage(title: _appBarname, todo: todo),
      ),
    );
    if (updated == null) return;
    setState(() => _todos[index] = updated);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD3D3D3),
      resizeToAvoidBottomInset: false,
      
      appBar: AppBar(
        backgroundColor: const Color(0xFFD3D3D3),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true, 
        title: Text(
          _appBarname,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      
      body: _todos.isEmpty
          ? NoToDoCard(appBarTitle: _appBarname)
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ToDoView(
                  todo: _todos[index],
                  onTap: () => _openDetail(index),
                  onToggleDone: () => _toggleDone(index),
                  onToggleFavorite: () => _toggleFavorite(index),
                );
              },
            ),
            
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: const Color(0xFFE0602A),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 24),
      ),
    );
  }
}