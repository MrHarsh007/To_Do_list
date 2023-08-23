import 'package:to_do_list/models/todo.dart';
import 'package:to_do_list/repositories/repository.dart';

class TodoService {
  late Repository _repository;

  TodoService() {
    _repository = Repository();
  }

  saveTodo(Todo todo) async {
    return await _repository.insertData('todos', todo.todoMap());
  }

  // read todo
  readTodos() async {
    return await _repository.readData('todos');
  }
}
