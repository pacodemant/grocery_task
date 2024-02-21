import 'package:grocery_task/home/models/product.dart';

class Cart {
  List<CartItem> items;

  Cart(this.items);
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}
