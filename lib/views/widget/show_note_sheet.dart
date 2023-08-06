import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/cubit/add_note_cubit.dart';
import 'package:note_app/views/componant/snackbar.dart';

import 'add_note_form_field.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNotefailure) {
          snackBar(context, text: state.errMessage);
        }
        if (state is AddNoteSuccessfull) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return const Padding(
          padding: EdgeInsets.only(
            top: 40,
            right: 16,
            left: 16,
          ),
          child: AddNoteForm(),
        );
      },
    );
  }
}
