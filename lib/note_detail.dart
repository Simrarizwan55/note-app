import 'package:flutter/material.dart';
import 'package:note_app/widgets/primary_app_bar.dart';
import 'package:note_app/widgets/primary_button.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PrimaryAppBar(
        title: '28/10/2012',
        prefixIcon:
        IconButton(icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: PrimaryButton(
          onPressed: () {},
          text: "Save Notes",
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 40,
            left: 34,
            right: 34,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[ const Row( children: [
              Text(
                "28/10/2012",
                style: TextStyle(
                  color: Colors.red,
                  fontStyle: FontStyle.normal,
                  fontSize: 22,
                ),
              ),
            ], ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Text(
                  "Lorem ipsum dolor sit amet,"
                      " consectetur adipiscing elit, "
                      "sed do eiusmod tempor incididunt. "
                      "Lorem ipsum dolor sit amet, consectetur adipiscing "
                      "elit, sed do eiusmod tempor incididunt....",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}