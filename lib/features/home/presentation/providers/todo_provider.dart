import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_with_clean_architecture/features/home/data/repositories/todo_repository_impl.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/domain/usecases/get_todo_usecase.dart';

part 'todo_provider.g.dart';

@riverpod
Stream<List<TodoEntity>> todo(TodoRef ref) {
  final repository = ref.watch(todoRepositoryProvider);
  return GetTodoUsecase(repository: repository)();
}
