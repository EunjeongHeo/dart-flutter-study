import 'package:flutter/material.dart';

class NoToDoCard extends StatelessWidget {
  final String appBarTitle;
  const NoToDoCard({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cs.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/images/task.webp',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '아직 할 일이 없음',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: cs.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '할 일을 추가하고 $appBarTitle에서\n할 일을 추적하세요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: cs.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
