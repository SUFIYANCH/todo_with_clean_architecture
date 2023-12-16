import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_constants.g.dart';

final class HomeConstants {
  final txtAppBarTitle = 'ToDo';
}

@riverpod
HomeConstants hmConstants(HmConstantsRef ref) {
  return HomeConstants();
}
