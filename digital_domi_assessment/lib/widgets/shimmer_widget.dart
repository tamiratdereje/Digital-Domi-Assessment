import 'package:flutter/material.dart';

class ShimmerCardUI extends StatelessWidget {
  const ShimmerCardUI({
    super.key,
    required this.width,
    required this.height,
    required this.circular,
    this.color,
  });

  final double width;
  final Color? color;
  final double height;
  final double circular;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circular),
      ),
      child: Container(
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}
