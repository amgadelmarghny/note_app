import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'note_appdar.dart';
import 'note_item.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: Column(
        children: <Widget>[
         const  CustomAppBar(iconData: FontAwesomeIcons.magnifyingGlass, title: 'Note',),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return const NoteItem();
                }),
          )
        ],
      ),
    );
  }
}
