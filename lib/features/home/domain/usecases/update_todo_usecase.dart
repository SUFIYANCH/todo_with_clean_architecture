import 'package:todo_with_clean_architecture/core/exceptions/todo/cannot_update_todo_exception.dart';
import 'package:todo_with_clean_architecture/core/exceptions/todo/invalid_title_exception.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';

final class UpdateTodoUsecase {
  final TodoRepository repository;

  UpdateTodoUsecase({required this.repository});

  Future<void> call({
    required String title,
    required bool isChecked,
    required String id,
  }) async {
    try {
      if (title.trim().isEmpty) {
        throw InvalidTitleException();
      }

      final todo = TodoEntity(id: id, title: title, isChecked: isChecked);
      await repository.updateTodo(todo);
    } catch (e) {
      throw CannotUpdateTodoException();
    }
  }
}
