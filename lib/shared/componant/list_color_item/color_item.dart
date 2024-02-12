import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/shared/bloc/notes_cubit/notes_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
  final Color color;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: isActive
          ? CircleAvatar(
              radius: 38,
              backgroundColor: BlocProvider.of<NotesCubit>(context).isLight
                  ? Colors.black54
                  : Colors.white,
              child: CircleAvatar(
                radius: 34,
                backgroundColor: color,
              ),
            )
          : CircleAvatar(
              radius: 38,
              backgroundColor: color,
            ),
    );
  }
}
