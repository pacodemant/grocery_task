// home/repository/products_repository.dart
import 'package:flutter/material.dart';
import 'package:grocery_task/home/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository {
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    return productsMock;
  }

  Stream<List<Product>> getProductsStream() {
    return FirebaseFirestore.instance.collection('products').snapshots().map(
      (snapshot) {
        return snapshot.docs
            .map((doc) => Product.fromJson(doc.data()))
            .toList();
      },
    );
  }

  Future<void> addProductsToFirestore() async {
    await FirebaseFirestore.instance
        .collection('products')
        .get()
        .then((snapshot) {
      snapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
    // Add products to firestore
    for (Product product in productsMock) {
      // Add product to firestore
      FirebaseFirestore.instance.collection('products').add(product.toJson());
    }
  }
}

final List<Product> productsMock = [
  const Product(
    name: 'Fresh Peach',
    description: 'dozen',
    price: 8.00,
    imageAsset: 'assets/images/peach.png',
    color: Color(
      0xffFFCEC1,
    ),
  ),
  const Product(
    name: 'Avocado',
    description: '2.0 lbs',
    price: 7.00,
    imageAsset: 'assets/images/avocado.png',
    color: Color(
      0xffFCFFD9,
    ),
    badge: ProductBadge(
      name: 'New',
      color: Color(0xffE8AD41),
    ),
  ),
  const Product(
    name: 'Pineapple',
    description: '1.15 lbs',
    price: 9.90,
    imageAsset: 'assets/images/pineapple.png',
    color: Color(
      0xffFFE6C2,
    ),
  ),
  const Product(
    name: 'Black grapes',
    description: '5 lbs',
    price: 7.05,
    imageAsset: 'assets/images/grapes.png',
    color: Color(
      0xffFEE1ED,
    ),
    badge: ProductBadge(
      name: '-16%',
      color: Color(0xffF56262),
    ),
  ),
  const Product(
    name: 'Pomegranate',
    description: '1.50 lbs',
    price: 2.09,
    imageAsset: 'assets/images/pomegranate.png',
    color: Color(
      0xffFFE3E2,
    ),
    badge: ProductBadge(
      name: 'New',
      color: Color(0xffE8AD41),
    ),
  ),
  const Product(
    name: 'Fresh Broccoli',
    description: '3 lbs',
    price: 1,
    imageAsset: 'assets/images/broccoli.png',
    color: Color(
      0xffD2FFD0,
    ),
  ),
];
