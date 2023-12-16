import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_with_clean_architecture/core/constants/home/home_constants.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/widgets/add_item_btn_widget.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/widgets/todo_list_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppTheme.of(context).colors;
    final spaces = AppTheme.of(context).spaces;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        title: Text(ref.watch(hmConstantsProvider).txtAppBarTitle),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const AddItemButtonWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: spaces.space_300, vertical: spaces.space_300),
        child: const TodoListWidget(),
      ),
    );
  }
}
