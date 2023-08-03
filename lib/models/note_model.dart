class NoteModel {
  final String title;
  final DateTime dateCreated;
  final String content;
  final int color;

  NoteModel( {required this.color,
    required this.title,
    required this.dateCreated,
    required this.content,
  });
}
