import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import "package:provider/provider.dart";
import '../core/notes_list.dart';
import '../edit_notes.dart';
import '../models/note_model.dart';

class NotesMake extends StatelessWidget {
  final NoteModel note;

  const NotesMake({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    final notesList = Provider.of<NotesList>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  DateFormat("yyyy/MM/dd").format(note.createdAt),
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ),
              // Spacer(),
              // SizedBox(width:100,),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.red),
                onPressed: () {
                  // notesList.updateNote(note.id, note.description);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditNotes(
                        note: note,
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  notesList.deleteNote(note.id);
                },
              ),
            ],
          ),
          Text(
            note.description,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
