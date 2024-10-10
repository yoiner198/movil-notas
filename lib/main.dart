import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:notes_2024/controllers/categorias_controller.dart';
import 'package:notes_2024/firebase_options.dart';
import 'package:notes_2024/screens/note_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Verifica si Firebase ya ha sido inicializado
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Get.put(CategoriasController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Notas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesScreen(),
    );
  }
}
