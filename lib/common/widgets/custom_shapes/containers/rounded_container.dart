import 'package:flutter/material.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.child,
    this.padding,
    this.margin,
    this.showBorder = false,
    this.showRadius = true,
    this.borderColor = TColors.borderPrimary,
    this.backgroundColor = TColors.white,
    this.radius = TSizes.cardRadiusLg,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder, showRadius;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: showRadius ? BorderRadius.circular(radius) : null,
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
