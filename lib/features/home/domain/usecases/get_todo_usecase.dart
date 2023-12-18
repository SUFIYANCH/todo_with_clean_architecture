import 'package:todo_with_clean_architecture/core/exceptions/todo/cannot_get_todo_exception.dart';
import 'package:todo_with_clean_architecture/core/exceptions/todo/invalid_title_exception.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';

final class GetTodoUsecase {
  final TodoRepository repository;
  GetTodoUsecase({required this.repository});

  Stream<List<TodoEntity>> call() async* {
    try {
      final todoStream = repository.getTodo();
      await for (final todos in todoStream) {
        for (final todo in todos) {
          if (todo.title.trim().isEmpty) {
            throw InvalidTitleException();
          }
        }

        yield todos;
      }
    } catch (e) {
      throw CannotGetTodoException();
    }
  }
}
