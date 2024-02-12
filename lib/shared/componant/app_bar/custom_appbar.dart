import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/shared/bloc/notes_cubit/notes_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.iconData,
    required this.title,
    this.onPressed,
  });
  final IconData iconData;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(
      builder: (context, state) {
        return Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                fontFamily: 'null',
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(.35),
              ),
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<NotesCubit>(context).changeBritness();
                },
                icon: const Icon(Icons.brightness_6_outlined),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(.35),
              ),
              child: IconButton(
                onPressed: onPressed,
                icon: Icon(iconData),
              ),
            ),
          ],
        );
      },
    );
  }
}
