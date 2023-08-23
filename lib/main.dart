


import 'package:flutter/cupertino.dart';
import 'package:to_do_list/src/App.dart';

void main() => runApp(App());

//





// import 'dart:async';
// import 'dart:js';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
// // void main() {
// //   runApp(MyApp());
// // }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter Home Page'),
//       ),
//       body: Center(
//         child: Text(
//           'Hello, Flutter!',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class Splash_screen extends StatefulWidget {
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<Splash_screen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       navigateToMainScreen();
//     });
//   }
//   void navigateToMainScreen() {
//     Navigator.of(context as BuildContext).pushReplacement(
//       MaterialPageRoute(builder: (context) => TodoApp()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('asset/Screenshot 2022-03-06 193646.png',
//               width: 200,
//               height: 200,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TodoApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TodoListScreen(),
//     );
//   }
// }
//
//
// class TodoListScreen extends StatefulWidget {
//   @override
//   _TodoListScreenState createState() => _TodoListScreenState();
// }
//
// class _TodoListScreenState extends State<TodoListScreen> {
//   List<String> tasks = [];
//
//   void addTask(String task) {
//     setState(() {
//       tasks.add(task);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('To-Do List'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: tasks.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(tasks[index]),
//                 );
//               },
//             ),
//           ),
//           AddTaskForm(addTask),
//         ],
//       ),
//     );
//   }
// }
//
// class AddTaskForm extends StatefulWidget {
//   final Function(String) addTaskCallback;
//
//   AddTaskForm(this.addTaskCallback);
//
//   @override
//   _AddTaskFormState createState() => _AddTaskFormState();
// }
//
// class _AddTaskFormState extends State<AddTaskForm> {
//   final TextEditingController _taskController = TextEditingController();
//
//   void _submitTask() {
//     if (_taskController.text.isNotEmpty) {
//       widget.addTaskCallback(_taskController.text);
//       _taskController.clear();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           TextField(
//             controller: _taskController,
//             decoration: InputDecoration(labelText: 'Add a task'),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: _submitTask,
//             child: Text('Add Task'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// void main() => runApp(MaterialApp(
//   home: Splash_screen(),
// ));