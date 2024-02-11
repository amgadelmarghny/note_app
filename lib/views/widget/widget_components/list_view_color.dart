import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/bloc/add_note_cubit/add_note_cubit.dart';

import '../../../app_constants/app_color.dart';
import 'color_item.dart';

class ListViewColor extends StatefulWidget {
  const ListViewColor({super.key});

  @override
  State<ListViewColor> createState() => _ListViewColorState();
}

class _ListViewColorState extends State<ListViewColor> {
  int isChoice = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 3,
      child: ListView.builder(
          itemCount: AppColor.kColor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                isChoice = index;
                BlocProvider.of<AddNoteCubit>(context).color =
                    AppColor.kColor[index];
                setState(() {});
              },
              child: ColorItem(
                isActive: isChoice == index,
                color: AppColor.kColor[index],
              ),
            );
          }),
    );
  }
}

