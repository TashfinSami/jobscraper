import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/device/device_utility.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.onTap,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.showShadow = false,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder, showShadow;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? TColors.blackGrey
                    : TColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(100),
            border: showBorder ? Border.all(color: TColors.grey) : null,
            boxShadow: showShadow
                ? dark
                    ? null
                    : [
                        BoxShadow(
                          color: TColors.secondary.withOpacity(0.9),
                          blurRadius: 9.0,
                          offset: const Offset(0, 5),
                        ),
                      ]
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColors.darkGrey,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
