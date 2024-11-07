import 'package:flutter/material.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/device/device_utility.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class FavoritesBar extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesBar({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
      height: 30,
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: 160,
        child: TabBar(
          labelPadding: EdgeInsets.zero,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            color: dark ? TColors.textWhite.withOpacity(0.2) : TColors.darkerGrey.withOpacity(0.2),
          ),
          unselectedLabelColor: TColors.darkGrey,
          labelColor: dark ? TColors.white : TColors.black,
          dividerColor: Colors.transparent,
          tabs: tabs,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
