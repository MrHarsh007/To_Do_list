import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/Screen/todo_service.dart';
import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/services/FolderServices.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/Screen/Folder.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var _todoTitleController = TextEditingController();
  var _todoDateController = TextEditingController();
  var _selectedValue;
  List<DropdownMenuItem<String>> _folders = [];

  var _categories;
  @override
  void initState() {
    super.initState();
    _loadFolders();
    _loadCategories();
  }

  _loadFolders() async {
    var _FolderService = FolderServices();
    var folders = await _FolderService.readFolder();
    folders.forEach((folder) {
      setState(() {
        _folders.add(DropdownMenuItem(
          child: Text(folders['name']),
          value: folder['name'],
        ));
      });
    });
  }

  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    _showSuccessSnackBar(SnackBar snackBar) {}
  }

  DateTime _dateTime = DateTime.now();

  _selectedTododate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat('dd-mm-yyyy').format(_pickedDate);
      });
    }
  }

  _loadCategories() async {
    // Replace this with your code to load categories
    // For example, you can populate _categories with DropdownMenuItem
    _categories = [
      DropdownMenuItem(value: 'Category 1', child: Text('Category 1')),
      DropdownMenuItem(value: 'Category 2', child: Text('Category 2')),
      // Add more categories as needed
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _todoTitleController,
              decoration: const InputDecoration(
                  labelText: 'Title', hintText: 'Write Todo Title'),
            ),
            TextField(
              controller: _todoDateController,
              decoration: InputDecoration(
                labelText: 'Date',
                hintText: 'Pick a Date',
                prefixIcon: InkWell(
                  onTap: () {
                    _selectedTododate(context);
                  },
                  child: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            DropdownButtonFormField(
                value: _selectedValue,
                items: _categories,
                hint: const Text('Category'),
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  var todoObject = Todo();
                  todoObject.title = _todoTitleController.text;
                  todoObject.isFinished = '0';
                  todoObject.folder = _selectedValue.toString();
                  todoObject.TodoDate = _todoDateController.text;

                  var _todoService = TodoService();
                  var result = await _todoService.saveTodo(todoObject);

                  if (result > 0) {
                    _showSuccessSnackBar(const Text('Created'));
                  }

                  print(result);
                },
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
