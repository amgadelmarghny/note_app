import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/widget/widget%20componant/custom_appdar.dart';

import 'widget componant/custom_text_field.dart';

class NoteEditViewBody extends StatelessWidget {
  const NoteEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Column(
        children: [
          CustomAppBar(
            iconData: FontAwesomeIcons.check,
            title: 'Edit Note',
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  hintText: 'Title',
                ),
                SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  hintText: 'context',
                  maxLine: 5,
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
