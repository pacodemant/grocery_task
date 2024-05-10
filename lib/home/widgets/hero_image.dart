import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          height: 300,
          imageUrl:
              'https://images.unsplash.com/photo-1542838132-92c53300491e?q=98&w=1548&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          placeholder: (context, url) => const SizedBox(
            height: 300,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
        const Positioned(
          bottom: 80,
          left: 40,
          width: 200,
          child: Text(
            '20% off on your first purchase',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
