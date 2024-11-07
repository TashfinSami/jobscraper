import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/common/widgets/favorite/favorite_job_icon.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_job_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/viewed_controller.dart';
import 'package:job_scraper/features/jobs/views/details/details.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class FavoriteVacancies extends StatelessWidget {
  const FavoriteVacancies({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteJobController.instance;
    final viewedController = ViewdController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: TSizes.defaultSpace),
              child: Text(
                '${controller.favoriteJobs.length} jobs',
                style: Theme.of(context).textTheme.titleSmall!.apply(color: TColors.darkGrey),
              ),
            ),
            const SizedBox(height: TSizes.md),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: ListView.separated(
                itemCount: controller.favoriteJobs.length,
                shrinkWrap: true,
                reverse: true,
                padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: TSizes.spaceBtwItems);
                },
                itemBuilder: (BuildContext context, int index) {
                  var job = controller.favoriteJobs[index];
                  return GestureDetector(
                    onTap: () {
                      viewedController.storeViewedJob(job);
                      Get.to(() => DetailsScreen(job: job));
                    },
                    child: Container(
                      height: 180,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: dark ? TColors.blackGrey : TColors.light,
                        boxShadow: dark
                            ? null
                            : [
                                BoxShadow(
                                  color: TColors.grey.withOpacity(0.9),
                                  blurRadius: 4.0,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                      ),
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
                                image: job.thumbnail != null
                                    ? NetworkImage(job.thumbnail!)
                                    : const AssetImage(TImages.companyLogoOrange) as ImageProvider,
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
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
