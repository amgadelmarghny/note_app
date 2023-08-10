import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/bloc/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/views/widget/widget%20componant/custom_appdar.dart';

import '../../app constants/app_string.dart';
import 'widget componant/custom_text_field.dart';
import 'widget componant/list_view_color.dart';

class NoteEditViewBody extends StatefulWidget {
  const NoteEditViewBody({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<NoteEditViewBody> createState() => _NoteEditViewBodyState();
}

class _NoteEditViewBodyState extends State<NoteEditViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Column(
        children: [
          CustomAppBar(
            onPressed: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subTitle = subTitle ?? widget.noteModel.subTitle;
              widget.noteModel.save();
              BlocProvider.of<NotesCubit>(context).fetchNote();
              Navigator.pop(context);
            },
            iconData: FontAwesomeIcons.check,
            title: 'Edit Note',
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onChange: (value) {
                    title = value;
                  },
                  hintText: widget.noteModel.title,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  onChange: (value) {
                    subTitle = value;
                  },
                  hintText: widget.noteModel.subTitle,
                  maxLine: 5,
                ),
                EditNoteViewColorList(
                  noteModel: widget.noteModel,
                )
              ],
            )),
          ),
        ],
      ),
    );
  }
}

class EditNoteViewColorList extends StatefulWidget {
  const EditNoteViewColorList({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteViewColorList> createState() => _EditNoteViewColorListState();
}

class _EditNoteViewColorListState extends State<EditNoteViewColorList> {
  late int isChoice;
  @override
  void initState() {
    isChoice = AppString.kColor.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 3,
      child: ListView.builder(
          itemCount: AppString.kColor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                isChoice = index;
                widget.noteModel.color = AppString.kColor[index].value;
                setState(() {});
              },
              child: ColorItem(
                isActive: isChoice == index,
                color: AppString.kColor[index],
              ),
            );
          }),
    );
  }
}
