import 'package:flutter/material.dart';
import 'package:note/components/note_settings.dart';
import 'package:popover/popover.dart';

class NoteTile extends StatelessWidget {
  final String title;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const NoteTile(
      {super.key,
      required this.title,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(25, 5, 25, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: ListTile(
        title: Text(title),
        trailing: Builder(
          builder: (context) => IconButton(
            onPressed: () => showPopover(
              context: context,
              bodyBuilder: (context) => NoteSettings(
                onEdit: onEdit,
                onDelete: onDelete,
              ),
              height: 100,
              width: 100,
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            icon: const Icon(
              Icons.more_vert,
            ),
          ),
        ),
      ),
    );
  }
}
