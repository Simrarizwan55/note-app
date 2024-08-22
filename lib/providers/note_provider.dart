// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:note_app/models/note_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:note_app/constants.dart';
//
// class NotesList extends ChangeNotifier {
//   final List<NoteModel> _notes = [];
//
//   List<NoteModel> get notes => _notes;
//
//   bool _isLoading = false;
//
//   bool get isLoading => _isLoading;
//
//   void _setLoader(bool value) {
//     _isLoading = value;
//     notifyListeners();
//   }
//
//   void getNotes() async {
//     try {
//       _setLoader(true);
//       http.Response response = await http.get(Uri.parse(notesUrl));
//       List<Map<String, dynamic>> listNotes = jsonDecode(response.body);
//       Iterable<NoteModel> serializedNotes = listNotes
//           .map((Map<String, dynamic> element) => NoteModel.fromMap(element));
//       _notes.clear();
//       _notes.addAll(serializedNotes);
//       print(response);
//     } catch (e) {
//       print(e);
//     } finally {
//       _setLoader(false);
//     }
//   }
//
//   void addNote(String description) {
//     final NoteModel note = NoteModel(
//       id: _notes.length.toString(),
//       description: description,
//       createdAt: DateTime.now(),
//       updatedAt: DateTime.now(),
//     );
//
//     _notes.add(note);
//
//     notifyListeners();
//   }
//
//   void deleteNote(String id) {
//     final NoteModel note =
//         _notes.firstWhere((NoteModel noteElement) => noteElement.id == id);
//     _notes.remove(note);
//     notifyListeners();
//   }
//
//   void updateNote(String id, String description) {
//     final NoteModel note =
//         _notes.firstWhere((NoteModel noteElement) => noteElement.id == id);
//     final index = _notes.indexOf(note);
//
//     NoteModel updatedNote = NoteModel(
//       id: id,
//       description: description,
//       createdAt: note.createdAt,
//       updatedAt: DateTime.now(),
//     );
//
//     _notes[index] = updatedNote;
//
//     notifyListeners();
//   }
// }
