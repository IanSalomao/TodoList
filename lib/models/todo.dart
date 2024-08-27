class Todo {
  final String title;
  bool isCompleted;
  String description;
  List<String> tags;

  Todo({
    required this.title,
    this.isCompleted = false,
    this.description = "",
    this.tags = const <String>[],
  });
}

List<String> setTagsFromString(String tagsString) {
  return tagsString
      .split(';')
      .map((tag) => tag.trim())
      .where((tag) => tag.isNotEmpty)
      .toList();
}
