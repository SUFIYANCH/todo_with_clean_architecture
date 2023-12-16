import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';

final class CannotDeleteTodoException extends BaseException {
  CannotDeleteTodoException() : super('Cannot delete todo. Please try again');
}
