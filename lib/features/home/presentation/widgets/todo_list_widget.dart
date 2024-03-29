import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';
import 'package:todo_with_clean_architecture/core/themes/extensions/color_extension.dart';
import 'package:todo_with_clean_architecture/core/themes/extensions/space_extension.dart';
import 'package:todo_with_clean_architecture/core/utils/error_snackbar_util.dart';
import 'package:todo_with_clean_architecture/features/home/domain/entities/todo_entity.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/providers/todo_provider.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/providers/todo_state_provider.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/widgets/bottomsheet_widget.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/widgets/delete_widget.dart';

class TodoListWidget extends ConsumerWidget {
  const TodoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppSpaceExtension spaces = AppTheme.of(context).spaces;
    final AppColorExtension colors = AppTheme.of(context).colors;

    void editTodo(TodoEntity todo) {
      showModalBottomSheet(
          context: context,
          builder: (context) => BottomsheetWidget(
                todo: todo,
              ));
    }

    void deleteTodo(TodoEntity todo) {
      showDialog(
          context: context,
          builder: ((context) => DeleteWidget(
                todo: todo,
              )));
    }

    void onCheckboxChange(TodoEntity todo, bool? value) {
      ref
          .read(todoStateProvider.notifier)
          .checkTodo(todo.id, value ?? false, todo.title)
          .then((error) => ErrorSnackbarUtil.showError(context, error));
    }

    return ref.watch(todoProvider).when(
          data: (data) {
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  SizedBox(height: spaces.space_150),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(spaces.space_100)),
                  tileColor: colors.secondary,
                  leading: Checkbox(
                    value: data[index].isChecked,
                    onChanged: (value) => onCheckboxChange(data[index], value),
                  ),
                  title: Text(
                    data[index].title,
                    maxLines: 2,
                    style: AppTheme.of(context).typography.ui,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => editTodo(data[index]),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => deleteTodo(data[index]),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          error: (_, __) {
            return const Center(child: Text('Something went wrong'));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
