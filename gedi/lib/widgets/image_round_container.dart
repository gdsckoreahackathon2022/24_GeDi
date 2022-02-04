import 'package:flutter/material.dart';

class ImageRoundContainer extends StatelessWidget {
  const ImageRoundContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.image,
    this.margin,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final ImageProvider<Object> image;
  final EdgeInsetsGeometry? margin;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 5.0,
          ),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
