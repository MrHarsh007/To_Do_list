import 'package:flutter/material.dart';
import 'package:to_do_list/repositories/repository.dart';

import '../models/folders_S.dart';

class FolderServices{
  late Repository _repository;

  FolderServices(){
    _repository = Repository();
  }

  saveFolder(Folders_S Folder) async{
    return await _repository.insertData('folder', Folder.folderMap());
  }

  readFolder() async{
    return await _repository.readData('folder');
  }
//Read Data from table Id
  readFolderById(folderId) async {
    return await _repository.readDataById('folders',folderId);
  }

  // Update data from table
  updateFolder(Folders_S folder) async {
    return await _repository.updateData('folder', folder.folderMap());
  }
//delete data from table
  deleteFolder(folderId)async{
    return await _repository.deleteData('folders', folderId);
  }
}