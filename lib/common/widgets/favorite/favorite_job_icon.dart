import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_job_controller.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class FavoriteJobIcon extends StatelessWidget {
  const FavoriteJobIcon({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteJobController.instance;

    return Obx(
      () => GestureDetector(
        onTap: () => controller.toggleFavoriteJob(job),
        child: Icon(
          controller.isFavorite(job.jobId!) ? Iconsax.heart5 : Iconsax.heart,
          color: Colors.red,
          size: TSizes.lg,
        ),
      ),
    );
  }
}
