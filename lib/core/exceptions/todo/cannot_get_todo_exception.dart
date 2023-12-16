import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';

final class CannotGetTodoException extends BaseException {
  CannotGetTodoException() : super('Cannot get todo list. Please try again');
}
