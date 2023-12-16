import 'package:todo_with_clean_architecture/core/exceptions/todo/cannot_get_todo_exception.dart';
import 'package:todo_with_clean_architecture/core/exceptions/todo/invalid_title_exception.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';

final class GetTodoUsecase {
  final TodoRepository repository;
  GetTodoUsecase({required this.repository});

  Stream<TodoEntity> call() async* {
    try {
      final todoStream = repository.getTodo();
      await for (final todo in todoStream) {
        if (todo.title.trim().isEmpty) {
          throw InvalidTitleException();
        } else {
          yield todo;
        }
      }
    } catch (e) {
      throw CannotGetTodoException();
    }
  }
}
