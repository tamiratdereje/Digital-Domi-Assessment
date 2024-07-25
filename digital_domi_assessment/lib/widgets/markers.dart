import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  final String imageUrl;

  const CustomMarker({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.grey,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(color: AppColors.black, width: 3),
          ),
        ),
        const InvertedTriangleContainer()
      ],
    );
  }
}

class InvertedTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class InvertedTriangleContainer extends StatelessWidget {
  const InvertedTriangleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: InvertedTriangleClipper(),
      child: Container(
        color: AppColors.black,
        width: 10,
        height: 5,
      ),
    );
  }
}
