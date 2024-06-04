import 'package:flutter/material.dart';

class NoteSettings extends StatelessWidget {
  final void Function()? onEdit;
  final void Function()? onDelete;

  const NoteSettings({super.key, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onEdit!();
            },
            child: Text(
              'Edit',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onDelete!();
            },
            child: Text(
              'Delete',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
