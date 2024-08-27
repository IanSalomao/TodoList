import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/models/todo.dart';

class TodoDataBase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void addInitialValue() {
    toDoList = [
      {
        'title': 'Sua tarefa',
        'isCompleted': false,
        'description': 'Descrição da tarefa',
        'tags': ['Tags', 'Tarefa rápida', 'Importante']
      },
      {
        'title': 'Essa tarefa está completa',
        'isCompleted': true,
        'description': '',
        'tags': <String>[]
      },
      {
        'title': 'Delete-me',
        'isCompleted': false,
        'description': 'Arraste essa tarefa pasa esquerda para deletala.',
        'tags': ['<<<', '<<<', '<<<']
      },
    ];
  }

  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }

  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  void addTodo(Todo todo) {
    toDoList.add({
      'title': todo.title,
      'isCompleted': todo.isCompleted,
      'description': todo.description,
      'tags': todo.tags
    });
    updateDataBase();
  }

  void deleteTodo(index) {
    toDoList.removeAt(index);
    updateDataBase();
  }

  void toggleCompletion(index) {
    toDoList[index]['isCompleted'] = !toDoList[index]['isCompleted'];
  }

  Todo convertMapTodo(Map todo) {
    return Todo(
        title: todo['title'],
        isCompleted: todo['isCompleted'],
        description: todo['description'],
        tags: todo['tags']);
  }
}
