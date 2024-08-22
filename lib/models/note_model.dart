class NoteModel {
  final String id;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  NoteModel({
    required this.id,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map["id"],
      description: map["description"],
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
    );
  }
}
