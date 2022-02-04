import 'package:flutter/material.dart';

class IconRoundButton extends StatelessWidget {
  const IconRoundButton({
    Key? key,
    required this.width,
    required this.height,
    required this.icon,
    required this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  final double width;
  final double height;
  final IconData icon;
  final Color backgroundColor;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 5.0,
          ),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Icon(
          icon,
          size: height * 0.8,
        ),
      ),
    );
  }
}
