import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/shared/app_constants/app_string.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/shared/bloc/simble_bloc_observer.dart';
import 'package:note_app/layout/note_view.dart';

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
          fontFamily: 'Poppins',
          useMaterial3: true,
          brightness: Brightness.dark,
          hintColor: Colors.grey,
        ),
        home: const NoteView(),
      ),
    );
  }
}
