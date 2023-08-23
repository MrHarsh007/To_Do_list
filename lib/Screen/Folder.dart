// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Screen/Home.dart';
import 'package:to_do_list/models/folders_S.dart';
import 'package:to_do_list/services/FolderServices.dart';

class Folder extends StatefulWidget {

  @override
  State<Folder> createState() => _FolderState();
}

class _FolderState extends State<Folder> {

  var _folderNameController;

  var _editfolderNameController = TextEditingController();

  var _folder = Folders_S();
  var _FolderSarvices = FolderServices();

  var _folderList = List<Folders_S>;
  // List<Folders_S> _FolderList = List<Folders_S>;

  @override
  void initState(){
    super.initState();
    getAllFolder();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  getAllFolder() async{
    var folder = await _FolderSarvices.readFolder();
    var _folderList = List<Folders_S>;

    folder.forEach((Folders_S){
      setState((){
        var folderModel = Folders_S();
        folderModel.id = Folders_S['id'];
        folderModel.name =Folders_S['name'];
        _folderList.add(folderModel);
      });
    });
  }

  _editFolder(BuildContext context, folderId)async{
    _folder = await _FolderSarvices.readFolderById(folderId);
    setState(() {
      _editfolderNameController.text = _folder[0]['name']??'No Name';

    });
    _editFormDialog(context);
  }

  _showFormDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true ,builder: (param){
      return AlertDialog(
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
            child: Text('Cancel')
          ),

          ElevatedButton(
              onPressed: () async {
                _folder.name = _folderNameController.text;

                var result = await _FolderSarvices.saveFolder(_folder);
                if(result > 0){
                  Navigator.pop(context);
                  getAllFolder();
                }
              },
              child: Text('Save')
          ),
        ],

        title: Text('Folders'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _folderNameController,
                decoration: InputDecoration(
                    hintText: 'Write Folder Name',
                    labelText: 'Folders'
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _editFormDialog(BuildContext context){
    return showDialog(context: context, barrierDismissible: true ,builder: (param){
      return AlertDialog(
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel')
          ),

          ElevatedButton(
              onPressed: () async {
                _folder.id = _folder[0]['id'];
                _folder.name = _editfolderNameController.text;

                var result = await _FolderSarvices.updateFolder(_folder);
                if(result > 0){
                  Navigator.pop(context);
                  getAllFolder();
                  _showSuccessSnackBar(Text('Updated'));
                }
              },
              child: Text('Update ')
          ),
        ],

        title: Text('Edit Folders'),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _editfolderNameController,
                decoration: InputDecoration(
                    hintText: 'Write Folder Name',
                    labelText: 'Folders'
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  _deleteFormDialog(BuildContext context, folderId){
    return showDialog(context: context, barrierDismissible: true ,builder: (param){
      return AlertDialog(
        actions: <Widget>[
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel')
          ),

          ElevatedButton(
              onPressed: () async {

                var result = await _FolderSarvices.deleteFolder(folderId);
                if(result > 0){
                  Navigator.pop(context);
                  getAllFolder();
                  _showSuccessSnackBar(Text('Deleted'));
                }
              },
              child: Text('Delete')
          ),
        ],

        title: Text('Are you sure you want to delete this?'),
        // content: SingleChildScrollView(
        //   child: Column(
        //     children: <Widget>[
        //       TextField(
        //         controller: _editfolderNameController,
        //         decoration: InputDecoration(
        //             hintText: 'Write Folder Name',
        //             labelText: 'Folders'
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      );
    });
  }

  _showSuccessSnackBar(message){
    var _snackBar = SnackBar(content: message);
    _globalKey.currentState.showSnackBar(_snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        // leading: RaisedButton(
        //   onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home())),
        //   elevation: 0.0,
        //   child: Icon(Icons.arrow_back, color: Colors.black,),
        // ),
        // leading: RaisedButton(
        // ),
        title: Text('Folders',style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.yellowAccent,
      ),
      body: ListView.builder(itemCount: _folderList.length , itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.only(top:8.0,left: 16.0, right: 16.0),
          child: Card(
            elevation: 8.0,
            child: ListTile(
              leading: IconButton(icon: Icon(Icons.edit), onPressed: (){
                _editFolder(context, _folderList[index].id);
              },),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text(_folderList[index].name),
                  IconButton(
                      icon: Icon(Icons.delete, color: Colors.red,),
                      onPressed: (){
                        _deleteFormDialog(context, _folderList[index].id);
                      }
                  ),
                ],
              ),
              // subtitle: Text(_folderList[index].name),
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _showFormDialog(context);
      },
      child: Icon(Icons.add, color: Colors.black),
          backgroundColor: Colors.yellowAccent
      ),
    );
  }
}
