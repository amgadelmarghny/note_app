import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/shared/app_constants/app_string.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/shared/bloc/simble_bloc_observer.dart';
import 'package:note_app/layout/note_view.dart';
import 'package:note_app/shared/cash_helper/cash_helper.dart';
import 'package:note_app/shared/theme/theme.dart';

void main() async {
  await Hive.initFlutter();
  await CashHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(AppString.kNotesBox);
  Bloc.observer = SimbleBlocObserver();
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isLight = CashHelper.getCash('isLight');
    return BlocProvider(
      create: (context) => NotesCubit()..changeBritness(fromCash: isLight),
      child: BlocBuilder<NotesCubit, NotesStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeApp.darkTheme(),
            theme: ThemeApp.lightTheme(),
            themeMode: BlocProvider.of<NotesCubit>(context).isLight
                ? ThemeMode.light
                : ThemeMode.dark,
            home: const NoteView(),
          );
        },
      ),
    );
  }
}
