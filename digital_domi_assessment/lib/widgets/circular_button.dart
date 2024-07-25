import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onTap;
  const CircularButton(
      {super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          color: AppColors.black,
          shape: BoxShape.circle,
        ),
        child: icon,
      ),
    );
  }
}
