// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:note_app/widgets/primary_app_bar.dart';
// import 'package:note_app/widgets/primary_button.dart';
// import 'add_notes.dart';
//
// class FirstScreen extends StatelessWidget {
//   const FirstScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const PrimaryAppBar( title: 'Notes',),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24.0),
//         child: PrimaryButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const AddNotes()),
//             );
//           },
//           text: "Add Notes",
//           prefixIcon: Icons.add,
//         ),
//       ),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/images/first_screen.PNG",
//               fit: BoxFit.contain,
//               width: 250,
//             ),
//             // const SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }
