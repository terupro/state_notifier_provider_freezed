// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'todo.freezed.dart';
part 'todo.g.dart';

// [Freezed] 不変（Immutable）なクラスを生成できるパッケージ
// [factory] コンストラクタを書かなくて済む
// _$(クラス名)

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    @Default(false) bool completed,
  }) = _Todo;

  // JSON形式への変換 (データをDartで使えるようにする / Map型<key: value>)
  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);
}
