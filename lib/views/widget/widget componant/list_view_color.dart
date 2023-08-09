import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/add_note_cubit/add_note_cubit.dart';

class ListViewColor extends StatefulWidget {
  const ListViewColor({super.key});

  @override
  State<ListViewColor> createState() => _ListViewColorState();
}

class _ListViewColorState extends State<ListViewColor> {
  int isChoice = 0;
  final List<Color> color = const [
    Color(0xffcec2ff),
    Color(0xffB3B3F1),
    Color(0xffDCB6D5),
    Color(0xffCF8BA9),
    Color(0xffB15E6C),
    Color(0xffF2D7EE),
    Color(0xffD3BCC0),
    Color(0xffA5668B),
    Color(0xff69306D),
    Color(0xff0E103D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 3,
      child: ListView.builder(
          itemCount: color.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                isChoice = index;
                BlocProvider.of<AddNoteCubit>(context).color = color[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: isChoice == index,
                color: color[index],
              ),
            );
          }),
    );
  }
}

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
              backgroundColor: Colors.white,
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
