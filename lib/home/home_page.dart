import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_task/home/cart/cart_page.dart';
import 'package:grocery_task/home/models/cart.dart';
import 'package:grocery_task/home/models/product.dart';
import 'package:grocery_task/home/repository/products_repository.dart';
import 'package:grocery_task/home/widgets/home_body.dart';
import 'package:grocery_task/home/wishlist/wishlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({required this.toggleTheme, Key? key}) : super(key: key);

  final VoidCallback toggleTheme;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _products = ProductsRepository().getProducts();

  final Cart cart = Cart([]);

  final List<Product> wishlist = [];

  int _selectedIndex = 0;

  void _updateIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: [
            FutureBuilder(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HomeBody(
                      products: snapshot.data!,
                      cart: cart,
                      wishlist: wishlist,
                      toggleTheme: widget.toggleTheme,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const CartPage(),
            WishlistPage(
              wishlist: wishlist,
            ),
          ][_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _updateIndex,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart),
              label: 'Wishlist',
            ),
          ],
        ),
      ),
    );
  }
}
