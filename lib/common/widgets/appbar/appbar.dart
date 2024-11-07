import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/device/device_utility.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.padding = const EdgeInsets.symmetric(horizontal: TSizes.md),
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: padding,
      child: AppBar(
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  Iconsax.arrow_left,
                  color: darkMode ? TColors.white : TColors.dark,
                ),
              )
            : leadingIcon != null
                ? GestureDetector(onTap: leadingOnPressed, child: Icon(leadingIcon))
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
