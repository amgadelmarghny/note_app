import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/shared/componant/app_bar/custom_appbar.dart';
import '../note_item/note_item.dart';

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
          BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              List<NoteModel> notesList =
                  BlocProvider.of<NotesCubit>(context).noteList ?? [];
              if (notesList.isEmpty) {
                return const Expanded(
                  child: Center(
                    child: Text(
                      'Please add note',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: notesList.length,
                    itemBuilder: (context, index) {
                      return NoteItem(
                        note: notesList[index],
                        index: index,
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
