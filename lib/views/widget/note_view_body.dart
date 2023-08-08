import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'note_appdar.dart';
import 'note_item.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  initState() {
    BlocProvider.of<NotesCubit>(context).fetchNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Column(
        children: [
          const CustomAppBar(
            iconData: FontAwesomeIcons.magnifyingGlass,
            title: 'Note',
          ),
          BlocConsumer<NotesCubit, NotesState>(
            listener: (context, state) {},
            builder: (context, state) {
              //noteList
              List<NoteModel> notesList =
                  BlocProvider.of<NotesCubit>(context).noteList ?? [];
              return Expanded(
                child: ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      return NoteItem(
                        note: notesList[index],
                      );
                    }),
              );
            },
          )
        ],
      ),
    );
  }
}
