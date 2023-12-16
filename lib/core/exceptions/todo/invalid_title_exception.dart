import 'package:todo_with_clean_architecture/core/exceptions/base_exception.dart';

final class InvalidTitleException extends BaseException {
  InvalidTitleException() : super('Title should not be empty. Try again');
}
