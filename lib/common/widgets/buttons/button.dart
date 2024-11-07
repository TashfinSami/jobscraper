import 'package:flutter/material.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class TButton extends StatelessWidget {
  const TButton({
    super.key,
    this.padding = const EdgeInsets.only(left: TSizes.defaultSpace, right: TSizes.defaultSpace, bottom: TSizes.lg, top: TSizes.md),
    required this.onPressed,
    this.height = 70,
    this.width,
    this.color = TColors.primary,
    this.radius = 40,
    required this.child,
  });

  final EdgeInsetsGeometry padding;
  final VoidCallback onPressed;
  final double height;
  final double? width;
  final Color color;
  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: child,
        ),
      ),
    );
  }
}
