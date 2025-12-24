import 'package:flutter/material.dart';
import '../models/todo_entity.dart';

class ToDoView extends StatelessWidget {
  final ToDoEntity todo;
  final VoidCallback onToggleDone;
  final VoidCallback onToggleFavorite;
  final VoidCallback onTap;

  const ToDoView({
    super.key,
    required this.todo,
    required this.onToggleDone,
    required this.onToggleFavorite,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: onToggleDone,
            icon: Icon(todo.isDone ? Icons.check_circle : Icons.circle_outlined),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Text(
                todo.title,
                style: TextStyle(
                  fontSize: 16,
                  color: cs.onSurfaceVariant,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          IconButton(
            onPressed: onToggleFavorite,
            icon: Icon(todo.isFavorite ? Icons.star : Icons.star_border),
            visualDensity: VisualDensity.compact,
          ),
        ],
      ),
    );
  }
}
