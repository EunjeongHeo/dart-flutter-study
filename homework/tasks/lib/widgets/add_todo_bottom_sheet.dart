import 'package:flutter/material.dart';
import '../models/todo_entity.dart';

class AddTodoBottomSheet extends StatefulWidget {
  const AddTodoBottomSheet({super.key});

  @override
  State<AddTodoBottomSheet> createState() => _AddTodoBottomSheetState();
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _titleFocus = FocusNode();

  bool _showDescription = false;
  bool _isFavorite = false;

  bool get _canSave => _titleController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _titleFocus.requestFocus();
    });
    _titleController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    _titleFocus.dispose();
    super.dispose();
  }

  void saveToDo() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final desc = _descController.text.trim();
    final todo = ToDoEntity(
      title: title,
      description: desc.isEmpty ? null : desc,
      isFavorite: _isFavorite,
      isDone: false,
    );

    Navigator.of(context).pop(todo);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
          color: cs.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              focusNode: _titleFocus,
              textInputAction: TextInputAction.done,
              style: const TextStyle(fontSize: 16),
              decoration: const InputDecoration(
                hintText: '새 할 일',
                border: InputBorder.none,
              ),
              onSubmitted: (_) => saveToDo(),
            ),

            if (_showDescription) ...[
              const SizedBox(height: 12),
              SizedBox(
                height: 56,
                child: TextField(
                  controller: _descController,
                  expands: true,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    hintText: '세부정보 추가',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 8),

            Row(
              children: [
                if (!_showDescription)
                  IconButton(
                    icon: const Icon(Icons.short_text_rounded, size: 24),
                    onPressed: () => setState(() => _showDescription = true),
                    visualDensity: VisualDensity.compact,
                  ),
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.star : Icons.star_border,
                    size: 24,
                  ),
                  onPressed: () => setState(() => _isFavorite = !_isFavorite),
                  visualDensity: VisualDensity.compact,
                ),
                const Spacer(),
                TextButton(
                  onPressed: _canSave ? saveToDo : null,
                  child: Text(
                    '저장',
                    style: TextStyle(
                      color: _canSave
                          ? cs.primary
                          : cs.onSurface.withOpacity(0.38),
                    ),
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
