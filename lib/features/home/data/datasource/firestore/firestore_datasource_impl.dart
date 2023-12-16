import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_with_clean_architecture/features/home/data/datasource/firestore/firestore_datasource.dart';
import 'package:todo_with_clean_architecture/features/home/data/models/todo_model.dart';

part 'firestore_datasource_impl.g.dart';

final class FirestoreDatasourceImpl implements FirestoreDatasource {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference<TodoModel> collection = firestore
      .collection("todos")
      .withConverter(
          fromFirestore: TodoModel.fromFirestore,
          toFirestore: (todomodel, option) => todomodel.toFirestore());

  @override
  Future<void> addtodo(TodoModel todo) async {
    collection.add(todo);
  }

  @override
  Future<void> updateTodo(TodoModel todo, String id) {
    return collection.doc(id).update(todo.toFirestore());
  }

  @override
  Future<void> deleteTodo(String id) {
    return collection.doc(id).delete();
  }

  @override
  Stream<DocumentSnapshot<TodoModel>> getTodo() {
    return collection.doc().snapshots();
  }
}

@riverpod
FirestoreDatasource todoFirestoreDatasource(TodoFirestoreDatasourceRef ref) {
  return FirestoreDatasourceImpl();
}
