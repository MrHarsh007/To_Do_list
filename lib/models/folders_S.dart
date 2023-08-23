class Folders_S {
  late int id;
  late String name;

  // Constructor to initialize the properties
  Folders_S({required this.id, required this.name});

  // Method to convert object properties into a map
  Map<String, dynamic> folderMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;

    return mapping;
  }
}
