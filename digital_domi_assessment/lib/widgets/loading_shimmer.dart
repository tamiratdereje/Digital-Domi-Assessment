import 'package:digital_domi_assessment/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    required this.child,
    this.lightColor = true,
  });
  final Widget child;
  final bool? lightColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: lightColor!
          ? Theme.of(context).dividerColor
          : AppColors.skeletonColor2.withOpacity(0.5),
      highlightColor: Theme.of(context).dividerColor.withOpacity(0.5),
      child: child,
    );
  }
}
