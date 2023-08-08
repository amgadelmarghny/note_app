import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/app%20constants/app_string.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/simble_bloc_observer.dart';
import 'package:note_app/views/note_view.dart';

import 'bloc/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(AppString.kNotesBox);
  Bloc.observer = SimbleBlocObserver();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          useMaterial3: true,
          brightness: Brightness.dark,
          hintColor: Colors.grey,
        ),
        home: const NoteView(),
      ),
    );
  }
}
