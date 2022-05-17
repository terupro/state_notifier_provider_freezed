import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/models/todo.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier()
      : super(const [
          // サンプルのTodoを挿入
          Todo(id: '1', title: 'Buy a coffee'),
          Todo(id: '2', title: 'Buy a milk'),
          Todo(id: '3', title: 'Eat sushi'),
          Todo(id: '4', title: 'Build an sushi'),
          Todo(id: '5', title: 'Build my app'),
        ]);

  /// 新しいTODOを追加するメソッド
  void add(Todo todo) {
    state = [...state, todo];
  }

  /// IDを指定して、TODOを削除するメソッド
  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  /// IDを指定して、TODOの完了状態を切り替えるメソッド
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

// 「TodoListNotifier」の内容を持つ「todoListProvider」を作成
final todoListProvider = StateNotifierProvider<TodoListNotifier, List<Todo>>(
  (ref) {
    return TodoListNotifier();
  },
);
