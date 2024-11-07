import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_job_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/viewed_controller.dart';
import 'package:job_scraper/features/jobs/views/home/widgets/home_rounded_clip.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class HomeManagement extends StatelessWidget {
  const HomeManagement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final recentController = ViewdController.instance;
    final favoriteController = FavoriteJobController.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TRoundedClip(
              title: '${favoriteController.favoriteJobs.length}',
              subtitle: 'Jobs saved',
              image: TImages.vCheck,
              dots: TImages.vDots1,
              dTop: 25,
              dLeft: 58,
              color: const Color(0xFF4E36E2),
            ),
            TRoundedClip(
              title: '${recentController.viewedJobs.length}',
              subtitle: 'Reviewed',
              image: TImages.vQuestion,
              dots: TImages.vDots2,
              dTop: 20,
              dLeft: 115,
              color: const Color(0xFF48A9F8),
            ),
          ],
        ),
      ),
    );
  }
}
