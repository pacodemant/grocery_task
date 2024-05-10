import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageShowcase extends StatefulWidget {
  const ImageShowcase({Key? key}) : super(key: key);

  @override
  State<ImageShowcase> createState() => _ImageShowcaseState();
}

class _ImageShowcaseState extends State<ImageShowcase> {
  String? _imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();

            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);

            if (image != null) {
              setState(() {
                _imagePath = image.path;
              });
            }
          },
          child: const Text('Choose image'),
        ),
        const SizedBox(height: 16),
        if (_imagePath != null)
          Image.file(
            File(_imagePath!),
            height: 200,
            width: 200,
          ),
      ],
    );
  }
}
