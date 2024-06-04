import 'package:flutter/material.dart';
import 'package:note/components/drawer_tile.dart';
import 'package:note/pages/notes_page.dart';
import 'package:note/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.collections_bookmark_outlined,
              size: 60,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DrawerTile(
            title: 'Notes',
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotesPage(),
                  ),
                  (route) => false);
            },
          ),
          DrawerTile(
            title: 'Settings',
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
