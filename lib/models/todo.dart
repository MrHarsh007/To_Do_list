class Todo {
  late int id;
  late String title;
  late String description;
  late String folder;
  late String TodoDate;
  late String isFinished;
  late String category;

  Map<String, dynamic> todoMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['description'] = description;
    mapping['folder'] = folder;
    mapping['todoDate'] = TodoDate;
    mapping['isFinished'] = isFinished;
    mapping['category'] =
        category; // Add this line to include the category field

    return mapping;
  }
}
