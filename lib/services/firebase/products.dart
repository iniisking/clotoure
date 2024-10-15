import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addProduct(
    String name, double price, String category, String imageUrl) async {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  await products.add({
    'name': name,
    'price': price,
    'category': category,
    'imageUrl': imageUrl,
  });
}
