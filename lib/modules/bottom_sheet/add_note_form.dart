import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/shared/bloc/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/shared/componant/custom_button/custom_button.dart';
import 'package:note_app/shared/componant/custom_text_field/custom_text_field.dart';
import 'package:note_app/shared/componant/list_color_item/list_view_color.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  String? title, subTitle;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autoValidateMode,
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
            const ListViewColor(),
            BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (context, state) {
                return CustomButton(
                  text: 'Add',
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

      var formatedCurrentDate = DateFormat('dd-mm-yyyy').format(DateTime.now());
      NoteModel noteModel = NoteModel(
        title: title!,
        dateCreated: formatedCurrentDate,
        subTitle: subTitle!,
        color: Colors.blue.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }
}
