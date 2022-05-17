import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_models/todo_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _todoListProvider = ref.watch(todoListProvider);
    final _todoListNotifier = ref.watch(todoListProvider.notifier);
    final todo = _todoListProvider;

    return Scaffold(
      appBar: AppBar(title: const Text('StateNotifierProvider')),
      body: ListView.builder(
        itemCount: _todoListProvider.length,
        itemBuilder: (context, index) {
          final todo = _todoListProvider[index];
          return ListTile(
            title: Text(todo.title),
            leading: Icon(
              todo.completed ? Icons.check_box : Icons.check_box_outline_blank,
            ),
            trailing: TextButton(
              onPressed: () => _todoListNotifier.remove(todo.id),
              child: const Text('Delete'),
            ),
            onTap: () => _todoListNotifier.toggle(todo.id),
          );
        },
      ),
    );
  }
}
