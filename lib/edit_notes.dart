import 'package:flutter/material.dart';
import 'package:note_app/widgets/primary_app_bar.dart';
import 'package:note_app/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'core/notes_list.dart';
import 'models/note_model.dart';

class EditNotes extends StatefulWidget {
  const EditNotes({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    _descriptionController.text = widget.note.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Edit Note',
        prefixIcon: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: PrimaryButton(
          onPressed: _editNote,
          text: "Save Note",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 34,
          right: 34,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
            children: [
              Text(
                "Description",
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                ),
              ),
              Text(
                "*",
                style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.normal,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          TextFormField(
            controller: _descriptionController,
            maxLines: 8,
            decoration: InputDecoration(
                hintText: "Type Here...",
                hintStyle: const TextStyle(
                  color: Colors.black12,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                  const BorderSide(color: Colors.white54, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide:
                  const BorderSide(color: Colors.white54, width: 2.0),
                )),
          ),
        ]),
      ),
    );
  }

  void _editNote() {
    final String description = _descriptionController.text;

    if (description.isEmpty) {
      print("Add description first");
      return;
    }
    context.read<NotesList>().updateNote(widget.note.id, description);
    Navigator.pop(context);
  }
}
