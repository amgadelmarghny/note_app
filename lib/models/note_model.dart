import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  final String dateCreated;
  @HiveField(2)
  String subTitle;
  @HiveField(3)
  int color;

  NoteModel( {
    required this.color,
    required this.title,
    required this.dateCreated,
    required this.subTitle,
  });
}
