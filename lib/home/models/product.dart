import 'dart:ui';

import 'package:grocery_task/home/models/category.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final Category? category;

  final String imageAsset;

  final Color color;

  final ProductBadge? badge;

  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.color,
    this.category,
    this.badge,
  });

  factory Product.fromFirestore(Map<String, dynamic> firestoreDocument) {
    return Product(
      name: firestoreDocument['name'],
      description: firestoreDocument['description'],
      price: firestoreDocument['price'],
      imageAsset: firestoreDocument['imageAsset'],
      //DRUNTER - die Farbe wird aus dem Firestore Dokument gelesen (ist noch String) und in einen Color-Typ umgewandelt
      color: Color(
        int.parse(
          firestoreDocument['color'],
        ),
      ),
    );
  }
}

class ProductBadge {
  final String name;
  final Color color;

  const ProductBadge({
    required this.name,
    required this.color,
  });
}
