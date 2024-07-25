
import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarTitleWindow extends StatelessWidget {
  final String title;
  final String imageUri;
  final VoidCallback onTap;

  const AppBarTitleWindow({
    super.key,
    required this.title,
    required this.imageUri,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left:6 ,top: 6, bottom: 6, right: 20),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUri),
              radius: 23,
            ),
            SizedBox(width: 10),
            
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}
