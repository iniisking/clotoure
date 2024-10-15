import 'package:cloud_firestore/cloud_firestore.dart';

class ProductService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Method to fetch products by category (e.g., men, women)
  Future<List<Map<String, dynamic>>> fetchProducts(String category) async {
    QuerySnapshot snapshot = await firestore
        .collection('products')
        .where('category', isEqualTo: category)
        .get();

    // Map each document from Firestore to a product object (or a Map)
    return snapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}
