import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/providers/todo_state_provider.dart';

class DeleteWidget extends ConsumerWidget {
  final TodoEntity todo;
  const DeleteWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("Are you sure ?"),
      content: const Text("This todo will delete permenantly"),
      actions: [
        TextButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            child: const Text(
              "Cancel",
            )),
        TextButton(
          onPressed: () {
            ref.read(todoStateProvider.notifier).deleteTodo(todo.id);
            Navigator.of(context).pop();
          },
          child: Text(
            "Delete",
            style:
                TextStyle(color: AppTheme.of(context).colors.backgroundDanger),
          ),
        )
      ],
    );
  }
}
