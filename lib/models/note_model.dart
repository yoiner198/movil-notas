import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String id;
  String title;
  String content;
  DateTime date;
  String categoryId; // Añadimos el campo de categoría

  Note({
    required this.id,
    required this.title,
    required this.content,
    required this.date,
    required this.categoryId, // Nuevo campo requerido para la categoría
  });

  // Constructor desde Firestore con la categoría
  factory Note.fromFirestore(Map<String, dynamic> data, String documentId) {
    return Note(
      id: documentId,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      categoryId: data['categoryId'] ??
          '', // Obtenemos la categoría desde los datos de Firebase
    );
  }

  // Método para convertir el objeto Note a un mapa para enviar a Firebase
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'categoryId':
          categoryId, // Aseguramos que la categoría se guarde en Firebase
    };
  }

  int daysSinceCreation() {
    final currentDate = DateTime.now();
    return currentDate.difference(date).inDays;
  }
}
