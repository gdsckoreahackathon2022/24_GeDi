import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  final ImageProvider image;

  static void show(BuildContext context, {required ImageProvider image}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => ImageViewScreen(
          image: image,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'image',
      child: PhotoView(
        onTapDown: (context, tapDownDetails, value) {
          Navigator.of(context).pop();
        },
        imageProvider: image,
      ),
    );
  }
}
