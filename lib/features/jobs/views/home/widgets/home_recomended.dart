import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/common/widgets/texts/section_heading.dart';
import 'package:job_scraper/features/jobs/controllers/recomended/recomended_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/viewed_controller.dart';
import 'package:job_scraper/features/jobs/views/details/details.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class HomeRecomended extends StatelessWidget {
  const HomeRecomended({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = RecomendedController.instance;
    final viewedController = ViewdController.instance;

    final dark = THelperFunctions.isDarkMode(context);

    return Obx(
      () => Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: TSectionHeading(
                title: 'Recomended Jobs',
                option: AnimatedSmoothIndicator(
                  activeIndex: controller.carouselCurrentIndex.value,
                  count: controller.recomendedJobs.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: dark ? TColors.secondary : TColors.primary,
                    dotHeight: 6,
                    dotWidth: 12,
                    expansionFactor: 2,
                  ),
                )),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Padding(
            padding: const EdgeInsets.only(left: TSizes.defaultSpace),
            child: SizedBox(
              height: 130,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, _) => controller.updatePageIndicator(index),
                ),
                items: controller.recomendedJobs
                    .map(
                      (job) => GestureDetector(
                        onTap: () {
                          viewedController.storeViewedJob(job);
                          Get.to(() => DetailsScreen(job: job));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: TSizes.defaultSpace),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: dark ? TColors.blackGrey : TColors.white,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image(
                                    fit: BoxFit.contain,
                                    image: job.thumbnail != null
                                        ? NetworkImage(job.thumbnail!)
                                        : const AssetImage(TImages.companyLogoOrange) as ImageProvider,
                                  ),
                                ),
                              ),
                              const SizedBox(width: TSizes.md),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      job.title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.titleLarge,
                                    ),
                                    const SizedBox(height: TSizes.xs),
                                    Text(
                                      job.location.trim(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context).textTheme.bodyMedium,
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
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
