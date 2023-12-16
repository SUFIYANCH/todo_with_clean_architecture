import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';

final class InvalidTodoException extends BaseException {
  InvalidTodoException() : super('Todo identifier is invalid.');
}
