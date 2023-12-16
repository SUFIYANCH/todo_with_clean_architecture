import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<void> addtodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(String id);
  Stream<TodoEntity> getTodo();
}
