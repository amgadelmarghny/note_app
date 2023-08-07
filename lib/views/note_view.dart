import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/views/widget/note_view_body.dart';

import 'componant/modal_bottom_sheet.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => NotesCubit(),
        child: const NoteViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showmodalBottomSheet(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
