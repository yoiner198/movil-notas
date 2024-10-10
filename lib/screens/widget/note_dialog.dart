import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_2024/controllers/note_controller.dart';
import 'package:notes_2024/controllers/categorias_controller.dart';
import 'package:notes_2024/models/note_model.dart';
import 'package:notes_2024/screens/widget/custom_textfield.dart';

class NoteDialog extends StatefulWidget {
  final Note? note;
  final bool isEdit;

  NoteDialog({super.key, this.note, this.isEdit = false});

  @override
  _NoteDialogState createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  final NoteController noteController = Get.find();
  final CategoriasController categoriasController =
      Get.put(CategoriasController());
  late TextEditingController titleController;
  late TextEditingController contentController;

  String? selectedCategoryId; // ID de la categoría seleccionada

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note?.title ?? '');
    contentController = TextEditingController(text: widget.note?.content ?? '');
    selectedCategoryId = widget
        .note?.categoryId; // Si es una edición, preseleccionar la categoría

    // Cargar las categorías (Esto se maneja en CategoriasController con fetchCategorias)
    categoriasController.fetchCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEdit ? 'Editar Nota' : 'Agregar Nota'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextField(
            hintText: 'Título',
            controller: titleController,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Contenido',
            controller: contentController,
          ),
          const SizedBox(height: 10),

          // Dropdown para seleccionar la categoría
          Obx(() {
            // Observamos la lista de categorías
            if (categoriasController.categorias.isEmpty) {
              return Text('Cargando categorías...');
            }
            return DropdownButton<String>(
              value: selectedCategoryId,
              hint: Text('Selecciona una categoría'),
              items: categoriasController.categorias.map((category) {
                return DropdownMenuItem<String>(
                  value: category.id,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategoryId = newValue;
                });
              },
            );
          }),
        ],
      ),
      actions: [
        ElevatedButton(
          child: Text(widget.isEdit ? 'Actualizar' : 'Guardar'),
          onPressed: () {
            if (selectedCategoryId == null) {
              // Mostrar un mensaje de error si no se selecciona una categoría
              Get.snackbar("Error", "Por favor, selecciona una categoría.");
              return;
            }

            if (widget.isEdit) {
              noteController.updateNote(
                Note(
                  id: widget.note!.id,
                  title: titleController.text,
                  content: contentController.text,
                  date: DateTime.now(),
                  categoryId: selectedCategoryId!,
                ),
              );
            } else {
              noteController.addNote(
                Note(
                  id: '',
                  title: titleController.text,
                  content: contentController.text,
                  date: DateTime.now(),
                  categoryId: selectedCategoryId!,
                ),
              );
            }

            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
