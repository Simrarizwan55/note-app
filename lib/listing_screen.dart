import 'package:flutter/material.dart';
import 'package:note_app/widgets/notes_make.dart';
import 'package:note_app/widgets/primary_app_bar.dart';
import 'package:note_app/widgets/primary_button.dart';
import 'package:provider/provider.dart';
import 'add_notes.dart';
import 'core/notes_list.dart';
import 'models/note_model.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => context.read<NotesList>().getNotes());
  }

  @override
  Widget build(BuildContext context) {
    final notesProvider = context.watch<NotesList>();
    return Scaffold(
      appBar: PrimaryAppBar(
        title: 'Notes',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: PrimaryButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNotes()),
            );
          },
          text: "Add Notes",
        ),
      ),
      body: notesProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : notesProvider.notes.isEmpty
              ? Center(
                  child: Image.asset(
                    "assets/images/first_screen.PNG",
                    fit: BoxFit.contain,
                    width: 250,
                  ),
                )
              : ListView.separated(
                  itemCount: notesProvider.notes.length,
                  itemBuilder: (_, int index) {
                    final NoteModel note = notesProvider.notes[index];
                    return NotesMake(note: note);
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox(height: 10);
                  },
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                    left: 34,
                    right: 34,
                  ),
                ),
    );
  }
}
