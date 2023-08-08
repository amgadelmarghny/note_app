import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note_model.dart';

import '../../bloc/add_note_cubit/add_note_cubit.dart';
import 'widget componant/custom_buttom_sheet.dart';
import 'widget componant/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  
  String? title, subTitle;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Title',
              onSaved: (data) {
                title = data;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              hintText: 'Content',
              onSaved: (data) {
                subTitle = data;
              },
              maxLine: 5,
            ),
            const SizedBox(
              height: 100,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButtomShet(
                  isLoading: state is AddNoteLoading ? true : false,
                  onTap: () {
                    validathionMeghod(context);
                  },
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void validathionMeghod(BuildContext context) {
     if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var currentDate = DateTime.now();
      var formatedCurrentDate =
          DateFormat('dd-mm-yyyy').format(currentDate);
      NoteModel noteModel = NoteModel(
        title: title!,
        dateCreated: formatedCurrentDate,
        subTitle: subTitle!,
        color: Colors.blue.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
