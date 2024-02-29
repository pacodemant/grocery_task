import 'package:flutter/material.dart';
import 'package:grocery_task/home/models/product.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({required this.wishlist, Key? key}) : super(key: key);

  final List<Product> wishlist;

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        if (widget.wishlist.isEmpty) const Text('Your wishlist is empty'),
        for (var product in widget.wishlist)
          ListTile(
            onTap: () {},
            title: Text(product.name),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  widget.wishlist.remove(product);
                });
              },
              icon: const Icon(Icons.delete),
            ),
          ),
      ],
    );
  }
}
