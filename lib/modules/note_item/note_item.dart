import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/modules/edit_note/note_edit_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note, required this.index});
  final NoteModel note;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return NoteEditView(
                noteModel: note,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Color(note.color),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          ListTile(
            title: Text(
              note.title,
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                note.subTitle,
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(.4)),
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNote();
                },
                icon: const Icon(
                  FontAwesomeIcons.trash,
                  color: Colors.black,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 24, bottom: 10),
            child: Text(
              note.dateCreated,
              style:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(.4)),
            ),
          )
        ]),
      ),
    );
  }
}
