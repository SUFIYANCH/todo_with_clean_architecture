import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';
import 'package:todo_with_clean_architecture/core/themes/extensions/color_extension.dart';
import 'package:todo_with_clean_architecture/core/themes/extensions/space_extension.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/providers/todo_provider.dart';
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

    void editTodo() {
      showModalBottomSheet(
          context: context, builder: (context) => const BottomsheetWidget());
    }

    void deleteTodo() {
      showDialog(
          context: context, builder: ((context) => const DeleteWidget()));
    }

    void onCheckboxChange(bool? value) {}

    return ref.watch(todoProvider).when(
          data: (data) {
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  SizedBox(height: spaces.space_150),
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(spaces.space_100)),
                  tileColor: colors.secondary,
                  leading: Checkbox(
                    value: false,
                    onChanged: onCheckboxChange,
                  ),
                  title: Text(
                    "dgvhhd",
                    maxLines: 2,
                    style: AppTheme.of(context).typography.ui,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => editTodo(),
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: deleteTodo,
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
