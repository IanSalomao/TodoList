import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_app/common/constants/app_colors.dart';
import 'package:todo_list_app/common/constants/app_text_styles.dart';
import 'package:todo_list_app/models/todo.dart';

class CardTodo extends StatelessWidget {
  final Todo todo;
  final Function(bool?)? onChanged;
  final Function(BuildContext) deleteTodo;

  const CardTodo({
    super.key,
    required this.todo,
    required this.onChanged,
    required this.deleteTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              spacing: 1,
              foregroundColor: AppColors.white,
              flex: 1,
              label: 'Deletar',
              borderRadius: BorderRadius.circular(20),
              onPressed: deleteTodo,
              icon: Icons.delete,
              backgroundColor: const Color(0xFF823D3D),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color:
                todo.isCompleted ? AppColors.primaryColorx2 : AppColors.grayx0,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TÍTULO
                  Expanded(
                    child: Text(
                      todo.title,
                      style: const TextStyle(
                        color: Color(0xff00958C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                    ),
                  ),

                  // CHECKBOX
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: onChanged,
                    fillColor: todo.isCompleted
                        ? const WidgetStatePropertyAll(Color(0xff00958C))
                        : const WidgetStatePropertyAll(Color(0xffC8C8C8)),
                    side:
                        const BorderSide(color: Color(0xFF929292), width: 1.2),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // DESCRIÇÃO
              Text(
                todo.description,
                style: AppTextStyles.smalText(
                  todo.isCompleted ? AppColors.grayx0 : AppColors.grayx1,
                ),
                textAlign: TextAlign.left,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),

              const SizedBox(height: 8),

              // TAGS
              Wrap(
                spacing: 8,
                runSpacing: 5, // Espaço entre as tags
                children: todo.tags.map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColorx3,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(tag,
                        style: AppTextStyles.smalText(AppColors.white)),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
