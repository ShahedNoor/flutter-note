import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:note/model/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  // Initialize the database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  // List of note
  final List<Note> currentNotes = [];

  // Create note
  Future<void> addNote(String textFromUser) async {
    final newNote = Note()..text = textFromUser;

    // Save to the database
    await isar.writeTxn(() => isar.notes.put(newNote));

    // Re-read from database
    fetchNotes();
  }

  // Read note
  Future<void> fetchNotes() async {
    List<Note> fetchNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchNotes);
  }

  // Update note
  Future<void> updateNote(int id, String newText) async {
    final existingNote = await isar.notes.get(id);
    if (existingNote != null) {
      existingNote.text = newText;
      await isar.writeTxn(() => isar.notes.put(existingNote));
      await fetchNotes();
    }
  }

  // Delete note
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
