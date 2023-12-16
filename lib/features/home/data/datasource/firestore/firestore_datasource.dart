import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_with_clean_architecture/features/home/data/models/todo_model.dart';

abstract class FirestoreDatasource {
  Future<void> addtodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo, String id);
  Future<void> deleteTodo(String id);
  Stream<DocumentSnapshot<TodoModel>> getTodo();
}
