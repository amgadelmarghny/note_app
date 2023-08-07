import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/bloc/cubit/add_note_cubit.dart';
import 'package:note_app/views/componant/snackbar.dart';

import 'add_note_form_field.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNotefailure) {
            snackBar(context, text: state.errMessage);
          }
          if (state is AddNoteSuccessfull) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            child: const Padding(
              padding: EdgeInsets.only(
                top: 40,
                right: 16,
                left: 16,
              ),
              child: AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
