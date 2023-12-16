import 'package:todo_with_clean_architecture/core/exceptions/todo/cannot_delete_todo_exception.dart';
import 'package:todo_with_clean_architecture/core/exceptions/todo/invalid_todo_exception.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';

final class DeleteTodoUsecase {
  final TodoRepository repository;

  DeleteTodoUsecase({required this.repository});

  Future<void> call({required String id}) async {
    try {
      if (id.trim().isEmpty) {
        throw InvalidTodoException();
      }

      await repository.deleteTodo(id);
    } catch (e) {
      throw CannotDeleteTodoException();
    }
  }
}
