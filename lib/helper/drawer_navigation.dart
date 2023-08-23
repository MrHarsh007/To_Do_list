import 'package:flutter/material.dart';
import 'package:to_do_list/Screen/Folder.dart';
import 'package:to_do_list/Screen/Home.dart';
import 'package:to_do_list/services/FolderServices.dart';

class DrawerNavigator extends StatefulWidget {
  @override
  _DrawerNavigatorState createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  List<Widget> _folderList = [];

  final FolderServices _folderServices = FolderServices();

  @override
  void initState() {
    super.initState();
    getAllFolder();
  }

  getAllFolder() async {
    var folders = await _folderServices.readFolder();

    folders.forEach((folder) {
      setState(() {
        _folderList.add(ListTile(
          title: Text(folder['name']),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.yellowAccent,
            child: Center(
                child: Text('To-Do List', style: TextStyle(fontSize: 25))),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Home())),
          ),
          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Folders'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Folder())),
          ),
          Divider(),
          Column(
            children: _folderList,
          ),
        ],
      ),
    );
  }
}
