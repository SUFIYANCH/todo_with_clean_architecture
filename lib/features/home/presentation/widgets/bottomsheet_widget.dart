import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/providers/todo_provider.dart';

class BottomsheetWidget extends ConsumerWidget {
  final TodoEntity? todo;

  const BottomsheetWidget({
    super.key,
    this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;

    void cancelAction() {
      Navigator.pop(context);
    }

    void createOrUpdateTodo() {}

    return Material(
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: space.space_300),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller:
                    ref.watch(todoStateProvider.notifier).titleController,
                autofocus: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(space.space_150),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(space.space_150),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colors.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(space.space_300))),
                    onPressed: cancelAction,
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(space.space_300)),
                        backgroundColor: colors.primary),
                    onPressed: createOrUpdateTodo,
                    child: Text(
                      todo != null ? 'Update' : 'Create',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
