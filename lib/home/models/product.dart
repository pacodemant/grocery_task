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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imageAsset': imageAsset,
      'color': color.value.toString(),
      //DRUNTER - da wir für die Aufgabe category und badge nicht brauchen, sind sie auskommentiert
      //'category': category?.toMap(),
      //'badge': badge?.toMap(),
    };
  }
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
