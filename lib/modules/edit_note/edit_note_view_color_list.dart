import 'package:flutter/material.dart';
import '../../shared/app_constants/app_color.dart';
import '../../models/note_model.dart';
import '../../shared/componant/list_color_item/color_item.dart';

class EditNoteViewColorList extends StatefulWidget {
  const EditNoteViewColorList({super.key, required this.noteModel});
  final NoteModel noteModel;
  @override
  State<EditNoteViewColorList> createState() => _EditNoteViewColorListState();
}

class _EditNoteViewColorListState extends State<EditNoteViewColorList> {
  late int isChoice;
  @override
  void initState() {
    isChoice = AppColor.kColor.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

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
                widget.noteModel.color = AppColor.kColor[index].value;
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
