import 'dart:convert';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/note_model.dart';
import 'package:http/http.dart' as http;

class NotesList extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void getNotes() async {
    try {
      _setLoader(true);
      http.Response response = await http.get(Uri.parse(notesUrl));
      List<dynamic> listNotes = jsonDecode(response.body);
      Iterable<NoteModel> serializedNotes =
          listNotes.map((dynamic element) => NoteModel.fromMap(element));
      _notes.clear();
      _notes.addAll(serializedNotes);
      print(response);
    } catch (e) {
      print(e);
    } finally {
      _setLoader(false);
    }
  }

  void addNote(String description) async {
    try {
      _setLoader(true);
      http.Response response = await http.post(Uri.parse(notesUrl), body: {
        "description": description,
      });
      dynamic decodedResponse = jsonDecode(response.body);
      final NoteModel note = NoteModel.fromMap(decodedResponse);
      _notes.add(note);
      print(response);
    } catch (e) {
      print(e);
    } finally {
      _setLoader(false);
    } // Notify listeners after adding a note
  }

  void deleteNote(String id) async {
    try {
      _setLoader(true);
      final Uri deleteUrl = Uri.parse('$notesUrl/$id');
      http.Response response = await http.delete(deleteUrl);

      final NoteModel note = NoteModel.fromMap(jsonDecode(response.body));

      _notes.removeWhere((item) => item.id == note.id);
    } catch (e) {
      print(e);
    } finally {
      _setLoader(false);
    } // Notify listeners after deleting a note
  }

  void updateNote(String id, String description) async {
    try {
      _setLoader(true);
      http.Response response =
          await http.put(Uri.parse('$notesUrl/$id'), body: {
            'description':description
          });
      final NoteModel updatedNote = NoteModel.fromMap(
        jsonDecode(response.body),
      );

      int index = _notes.indexWhere((note) => note.id == id);
      // if (index != -1) {
        _notes[index] = updatedNote;
      // }
      print(response);
    } catch (e) {
      print(e);
    } finally {
      _setLoader(false);
    }
    // Notify listeners after updating a note

  }
}
