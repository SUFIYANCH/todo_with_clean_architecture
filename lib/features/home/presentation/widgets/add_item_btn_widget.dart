import 'package:flutter/material.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';
import 'package:todo_with_clean_architecture/features/home/presentation/widgets/bottomsheet_widget.dart';

class AddItemButtonWidget extends StatelessWidget {
  const AddItemButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppTheme.of(context).colors.primary,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const BottomsheetWidget(),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
