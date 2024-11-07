import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/common/widgets/appbar/appbar.dart';
import 'package:job_scraper/common/widgets/images/circular_image.dart';
import 'package:job_scraper/features/authentication/controllers/user_controller.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(
      () => TAppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good day for hunting',
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.white),
                ),
                Text(
                  controller.user.fullName,
                  style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),
                ),
              ],
            ),
            const TCircularImage(
              image: TImages.user,
              width: 50,
              height: 50,
              padding: 0,
            )
          ],
        ),
      ),
    );
  }
}
