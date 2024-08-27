import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/common/components/card_todo.dart';
import 'package:todo_list_app/common/components/dialog_box_add.dart';
import 'package:todo_list_app/common/constants/app_colors.dart';
import 'package:todo_list_app/common/constants/app_text_styles.dart';
import 'package:todo_list_app/data/database.dart';
import 'package:todo_list_app/models/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagController = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.addInitialValue();
    } else {
      db.loadData();
    }
    super.initState();
  }

  _checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toggleCompletion(index);
    });
    db.updateDataBase();
  }

  _saveNewTodo() {
    if (_titleController.text != '') {
      setState(() {
        db.addTodo(Todo(
          title: _titleController.text,
          description: _descriptionController.text,
          tags: setTagsFromString(_tagController.text),
        ));
        _titleController.clear();
        _descriptionController.clear();
        _tagController.clear();
      });
      db.updateDataBase();
      Navigator.of(context).pop(context);
    }
  }

  _cancel() {
    _titleController.clear();
    _descriptionController.clear();
    _tagController.clear();
    Navigator.of(context).pop(context);
  }

  _deleteTodo(index) {
    setState(() {
      db.deleteTodo(index);
    });
  }

  _callDialogBox() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            context: context,
            titleController: _titleController,
            descriptionController: _descriptionController,
            tagController: _tagController,
            onPressedSave: _saveNewTodo,
            onPressedCancel: _cancel,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _callDialogBox(),
        backgroundColor: AppColors.primaryColorx1,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),

      // ========= BODY HOME PAGE =========
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header Section
            Container(
              color: AppColors.primaryColorx0,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá Aluno',
                    style: AppTextStyles.largeTitle(Colors.white),
                  ),
                  Text(
                    'Preparado para um dia mais produtivo?',
                    style: AppTextStyles.title(Colors.white),
                  ),
                ],
              ),
            ),

            // Body Section
            Container(
              color: AppColors.primaryColorx0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: db.toDoList.map((todoMap) {
                    final todo = db.convertMapTodo(todoMap);
                    final index = db.toDoList.indexOf(todoMap);

                    return CardTodo(
                      todo: todo,
                      onChanged: (value) => _checkBoxChanged(value, index),
                      deleteTodo: (context) => _deleteTodo(index),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
