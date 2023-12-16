import 'package:todo_with_clean_architecture/core/exceptions/todo/cannot_add_todo_exception.dart';
import 'package:todo_with_clean_architecture/core/exceptions/todo/invalid_title_exception.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';

final class AddTodoUsecase {
  final TodoRepository repository;

  AddTodoUsecase({required this.repository});

  Future<void> call({
    required String title,
    required bool isChecked,
  }) async {
    try {
      if (title.trim().isEmpty) {
        throw InvalidTitleException();
      }

      final todo = TodoEntity(id: '', title: title, isChecked: isChecked);
      await repository.addtodo(todo);
    } catch (e) {
      throw CannotAddTodoException();
    }
  }
}
