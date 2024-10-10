import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes_2024/models/category.dart';
import 'package:notes_2024/services/category_services.dart';

class CategoriasController extends GetxController {
  final CategoriasServices _categoriasService = CategoriasServices();
  RxList<Categorias> categorias = <Categorias>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategorias();
  }

  void fetchCategorias() async {
    categorias.value = await _categoriasService.getCategorias();
  }

  Future<void> addCategorias(Categorias categorias) async {
    await _categoriasService.addCategorias(categorias);
    fetchCategorias(); // Refrescar la lista de notas después de agregar
  }

  Future<List<Categorias>> getCategories() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('categories').get();
    return snapshot.docs.map((doc) {
      return Categorias.fromFirestore(
          doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }
}
