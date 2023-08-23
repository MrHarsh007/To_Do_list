import 'package:flutter/material.dart';
import 'package:to_do_list/Screen/Folder.dart';
import 'package:to_do_list/Screen/Home.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/services/FolderServices.dart';

class DrawerNavigator extends StatefulWidget {

  @override
  State<DrawerNavigator> createState() => _DrawerNavigatorState();
}

class _DrawerNavigatorState extends State<DrawerNavigator> {
  List<Widget> _folderList = List<Widget>();

  FolderServices _folderServices = FolderServices();

  @override
  initStart(){
    super.initState();
    getAllFolder();
  }

  getAllFolder() async{
    var folder = await _folderServices.readFolder();

    folder.forEach((folder){
      setState(() {
        _folderList.add(ListTile(
          title: Text(folder['name']),
        ));
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(

      child: Drawer(
        child: Column(
          children: <Widget> [
            Container(
              height: 80.0,
              width: MediaQuery.of(context).size.width,
              color: Colors.yellowAccent,
              child: Center(child: Text('To-Do List',style: TextStyle(fontSize: 25),)),
            ),
            // UserAccountsDrawerHeader(
            //   currentAccountPicture: CircleAvatar(
            //     backgroundImage:NetworkImage(
            //       'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F9499849192390272%2F&psig=AOvVaw2W8FSsHp63BXX6yIKuzAGQ&ust=1692164110700000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCMDVztf43YADFQAAAAAdAAAAABAJ'
            //     ),
            //   ),
            //     accountName: Text('Vaibhavi', style: TextStyle(color: Colors.black)),
            //     accountEmail: Text('Admin', style: TextStyle(color: Colors.black)),
            //   decoration: BoxDecoration(color: Colors.yellow),
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home())),
            ),

            ListTile(
              leading: Icon(Icons.folder),
              title: Text('Folders'),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Folder())),
            ),

            Divider(),
            Column(
              children: _folderList,
            ),
          ],
        ),
      ),
    );
  }
}
