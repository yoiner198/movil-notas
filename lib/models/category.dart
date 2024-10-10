class Categorias {
  String id;
  String name;

  Categorias({required this.id, required this.name});

  factory Categorias.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return Categorias(
      id: documentId,
      name: data['name'] ?? '',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
