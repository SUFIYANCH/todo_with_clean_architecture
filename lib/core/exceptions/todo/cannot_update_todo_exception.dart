import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';

final class CannotUpdateTodoException extends BaseException {
  CannotUpdateTodoException() : super('Cannot update todo. Please try again');
}
