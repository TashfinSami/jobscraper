import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/common/widgets/favorite/favorite_job_icon.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/viewed_controller.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/features/jobs/views/details/details.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class JobListBuilder extends StatelessWidget {
  const JobListBuilder({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final viewedController = ViewdController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        viewedController.storeViewedJob(job);
        Get.to(() => DetailsScreen(job: job));
      },
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                height: 75,
                width: 75,
                child: Image(
                  fit: BoxFit.contain,
                  image: job.thumbnail != null ? NetworkImage(job.thumbnail!) : const AssetImage(TImages.companyLogoOrange) as ImageProvider,
                ),
              ),
            ),
            const SizedBox(width: TSizes.lg),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.companyName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: TSizes.xs),
                  Text(
                    job.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(),
                  if (job.extensions != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.access_time,
                          size: 24,
                          color: dark ? TColors.secondary : TColors.primary,
                        ),
                        const SizedBox(width: TSizes.md),
                        Text(
                          job.extensions!.first,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  const SizedBox(height: TSizes.sm),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 24,
                        color: dark ? TColors.secondary : TColors.primary,
                      ),
                      const SizedBox(width: TSizes.md),
                      Flexible(
                        child: Text(
                          job.location.trim(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: TSizes.md),
            FavoriteJobIcon(job: job),
          ],
        ),
      ),
    );
  }
}
