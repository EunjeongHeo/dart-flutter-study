import 'package:flutter/material.dart';
import '../models/todo_entity.dart';

class ToDoDetailPage extends StatefulWidget {
  final String title;
  final ToDoEntity todo;

  const ToDoDetailPage({
    super.key,
    required this.title,
    required this.todo,
  });

  @override
  State<ToDoDetailPage> createState() => _ToDoDetailPageState();
}

class _ToDoDetailPageState extends State<ToDoDetailPage> {
  late ToDoEntity _todo;

  @override
  void initState() {
    super.initState();
    _todo = widget.todo;
  }

  void _toggleFavorite() {
    setState(() {
      _todo = _todo.copyWith(isFavorite: !_todo.isFavorite);
    });
  }

  void _goBack() {
    Navigator.of(context).pop(_todo);
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _goBack,
        ),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: Icon(_todo.isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
        // 기본 스타일 유지(색/그림자 하드코딩 X)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_todo.title, style: titleStyle),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.short_text_rounded, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    (_todo.description ?? '').isEmpty
                        ? '새로운 할 일의 세부 내용'
                        : _todo.description!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
