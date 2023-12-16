import 'package:flutter/material.dart';
import 'package:todo_with_clean_architecture/core/themes/app_theme.dart';

class DeleteWidget extends StatelessWidget {
  const DeleteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          onPressed: (() {
            Navigator.of(context).pop();
          }),
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
