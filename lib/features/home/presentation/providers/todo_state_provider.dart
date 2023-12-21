import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';
import 'package:todo_with_clean_architecture/features/home/data/repositories/todo_repository_impl.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';
import 'package:todo_with_clean_architecture/features/home/domain/usecases/add_todo_usecase.dart';
import 'package:todo_with_clean_architecture/features/home/domain/usecases/delete_todo_usecase.dart';
import 'package:todo_with_clean_architecture/features/home/domain/usecases/update_todo_usecase.dart';

part 'todo_state_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  late final TextEditingController titleController;
  late TodoRepository repository;

  @override
  void build() {
    titleController = TextEditingController();
    repository = ref.watch(todoRepositoryProvider);

    ref.onDispose(dispose);
  }

  void dispose() {
    titleController.dispose();
  }

  /// Update todo
  Future<String?> updateTodo({
    required String id,
    required bool isChecked,
  }) async {
    try {
      final newTitle = titleController.text;
      await UpdateTodoUsecase(repository: repository)(
        id: id,
        isChecked: isChecked,
        title: newTitle,
      );
    } on BaseException catch (e) {
      return e.message;
    } catch (e) {
      return 'Unknown error occured';
    }

    return null;
  }

  /// Check todo
  Future<String?> checkTodo(String todoId, bool isChecked, String title) async {
    try {
      await UpdateTodoUsecase(repository: repository)(
        id: todoId,
        isChecked: isChecked,
        title: title,
      );
    } on BaseException catch (e) {
      return e.message;
    } catch (e) {
      return 'Unknown error occured';
    }

    return null;
  }

  /// Add todo
  Future<String?> addTodo() async {
    try {
      final title = titleController.text;
      await AddTodoUsecase(repository: repository)(
          title: title, isChecked: false);
    } on BaseException catch (e) {
      return e.message;
    } catch (e) {
      print(e);
      return 'Unknown error occured';
    }

    return null;
  }

  /// Delete todo
  Future<String?> deleteTodo(String id) async {
    try {
      await DeleteTodoUsecase(repository: repository)(id: id);
    } on BaseException catch (e) {
      return e.message;
    } catch (e) {
      return 'Unknown error occured';
    }

    return null;
  }
}
