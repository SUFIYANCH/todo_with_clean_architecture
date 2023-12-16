import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_with_clean_architecture/features/home/data/repositories/todo_repository_impl.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';
import 'package:todo_with_clean_architecture/features/home/domain/usecases/get_todo_usecase.dart';

part 'todo_provider.g.dart';

@riverpod
Stream<TodoEntity> todo(TodoRef ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return GetTodoUsecase(repository: repository)();
}

@Riverpod(keepAlive: true)
class TodoState extends _$TodoState {
  late final TextEditingController titleController;
  late final TodoRepository repository;

  @override
  void build() {
    titleController = TextEditingController();
    repository = ref.read(todoRepositoryProvider);

    ref.onDispose(dispose);
  }

  void dispose() {
    titleController.dispose();
  }

  /// Update todo
  Future<void> updateTodo({
    required String id,
  }) async {
    // await UpdateTodoUsecase(repository: repository)(id: id,);
  }
}
