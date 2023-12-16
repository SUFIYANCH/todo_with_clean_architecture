import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';

final class CannotAddTodoException extends BaseException {
  CannotAddTodoException() : super('Cannot add todo. Please try again');
}
