
class Folders_S {
  late int id;
  late String name;

  folderMap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['name'] = name;

    return mapping;
  }
}

