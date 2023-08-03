import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/views/widget/note_appdar.dart';

class NoteEditViewBody extends StatelessWidget {
  const NoteEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Column(
        children: [
          CustomAppBar(
            iconData: FontAwesomeIcons.magnifyingGlass,
            title: 'Edit',
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
          )),
        ],
      ),
    );
  }
}
