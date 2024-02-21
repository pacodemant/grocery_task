import 'package:flutter/material.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/background.png'),
        const Positioned(
          bottom: 80,
          left: 40,
          width: 200,
          child: Text(
            '20% off on your first purchase',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
