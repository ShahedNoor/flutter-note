import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/components/my_drawer.dart';
import 'package:note/components/note_tile.dart';
import 'package:note/model/note_database.dart';
import 'package:provider/provider.dart';

import '../model/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Controller for text-form-field for getting user input from user
  final textController = TextEditingController();

  // UI related functions

  // Create notes
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create a new note!'),
        content: TextFormField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              if (textController.text.isEmpty) {
                Navigator.pop(context);
                return;
              } else {
                context.read<NoteDatabase>().addNote(textController.text);
              }
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }

  // Read note
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  // Update note
  void updateNote(Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Note'),
        content: TextFormField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              if (textController.text.isEmpty) {
                Navigator.pop(context);
                return;
              } else {
                context.read<NoteDatabase>().updateNote(
                      note.id,
                      textController.text,
                    );
              }
              textController.clear();
              Navigator.pop(context);
            },
            child: const Text('Update'),
          )
        ],
      ),
    );
  }

  // Delete note
  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  void initState() {
    super.initState();
    readNote();
  }

  @override
  Widget build(BuildContext context) {
    // Note database
    final noteDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Heading
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 5.0, bottom: 5.0),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          // Notes
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                final note = currentNotes[index];
                return NoteTile(
                  title: note.text,
                  onEdit: () => updateNote(note),
                  onDelete: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
