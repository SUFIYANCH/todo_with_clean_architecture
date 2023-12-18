import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_with_clean_architecture/features/home/data/datasource/firestore/firestore_datasource.dart';
import 'package:todo_with_clean_architecture/features/home/data/datasource/firestore/firestore_datasource_impl.dart';
import 'package:todo_with_clean_architecture/features/home/data/models/todo_model.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/repositories/todo_repository.dart';

part 'todo_repository_impl.g.dart';

class TodoRepositoryImpl implements TodoRepository {
  final FirestoreDatasource dataSource;
  TodoRepositoryImpl({required this.dataSource});

  @override
  Future<void> addtodo(TodoEntity todo) async {
    final todoToAdd = TodoModel(title: todo.title, isChecked: todo.isChecked);
    await dataSource.addtodo(todoToAdd);
  }

  @override
  Future<void> deleteTodo(String id) async {
    await dataSource.deleteTodo(id);
  }

  @override
  Stream<List<TodoEntity>> getTodo() async* {
    final dataStream = dataSource.getTodo();
    await for (final snapshot in dataStream) {
      final modelsList = snapshot.docs;
      yield [
        for (final model in modelsList)
          TodoEntity(
              id: model.id,
              title: model.data().title,
              isChecked: model.data().isChecked)
      ];
    }
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    await dataSource.updateTodo(
        TodoModel(title: todo.title, isChecked: todo.isChecked), todo.id);
  }
}

@riverpod
TodoRepository todoRepository(TodoRepositoryRef ref) {
  return TodoRepositoryImpl(
      dataSource: ref.watch(todoFirestoreDatasourceProvider));
}
