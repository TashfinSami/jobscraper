import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:job_scraper/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:job_scraper/features/jobs/views/home/widgets/home_appbar.dart';
import 'package:job_scraper/features/jobs/views/search/search.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/device/device_utility.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          const TPrimaryHeaderContainer(
            child: Padding(
              padding: EdgeInsets.only(top: TSizes.xl),
              child: THomeAppBar(),
            ),
          ),
          Positioned(
            bottom: 10,
            width: TDeviceUtils.getScreenWidth(context),
            child: TSearchContainer(
              text: 'Search job here...',
              showBorder: false,
              showShadow: true,
              onTap: () => Get.to(() => const SearchScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
