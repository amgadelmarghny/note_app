import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/app%20constants/app_string.dart';
import 'package:note_app/views/note_view.dart';

void main() async {
 await Hive.initFlutter();
  await Hive.openBox(AppString.kNotesBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        useMaterial3: true,
        brightness: Brightness.dark,
        hintColor: Colors.grey,
      ),
      home: const NoteView(),
    );
  }
}
