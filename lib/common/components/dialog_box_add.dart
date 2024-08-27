import 'package:flutter/material.dart';
import 'package:todo_list_app/common/constants/app_colors.dart';
import 'package:todo_list_app/common/constants/app_text_styles.dart';

class DialogBox extends StatelessWidget {
  final BuildContext context;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController tagController;
  final VoidCallback? onPressedSave;
  final VoidCallback? onPressedCancel;

  const DialogBox({
    super.key,
    required this.context,
    required this.titleController,
    required this.descriptionController,
    required this.tagController,
    this.onPressedSave,
    this.onPressedCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        // CANCELAR
        TextButton(
          onPressed: onPressedCancel,
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFFACBEBE)),
          ),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.white),
          ),
        ),

        // SALVAR
        TextButton(
          onPressed: onPressedSave,
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFF009990)),
          ),
          child: const Text(
            'Salvar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],

      // INPUTS
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              cursorColor: AppColors.primaryColorx0,
              controller: titleController,
              maxLength: 35,
              decoration: InputDecoration(
                  hintText: 'Título da tarefa',
                  labelText: 'Título',
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColorx0),
                  ),
                  labelStyle: AppTextStyles.regularText(AppColors.grayx2)),
            ),
            TextFormField(
              cursorColor: AppColors.primaryColorx0,
              controller: descriptionController,
              maxLines: null,
              minLines: 3,
              maxLength: 200,
              decoration: InputDecoration(
                  labelText: 'Descrição',
                  hintText: 'Descrição da tarefa',
                  alignLabelWithHint: true,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primaryColorx0),
                  ),
                  labelStyle: AppTextStyles.regularText(AppColors.grayx2)),
            ),
            TextFormField(
              cursorColor: AppColors.primaryColorx0,
              controller: tagController,
              maxLines: null,
              minLines: 2,
              maxLength: 50,
              decoration: InputDecoration(
                labelText: 'Tags',
                hintText: "Adicione tags separadas por ';'",
                hintStyle: AppTextStyles.smalText(AppColors.grayx2),
                alignLabelWithHint: true,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryColorx0),
                ),
                labelStyle: AppTextStyles.regularText(AppColors.grayx2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
