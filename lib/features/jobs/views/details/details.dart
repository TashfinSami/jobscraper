import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/common/widgets/appbar/appbar.dart';
import 'package:job_scraper/common/widgets/buttons/button.dart';
import 'package:job_scraper/common/widgets/favorite/favorite_job_icon.dart';
import 'package:job_scraper/features/jobs/controllers/search/listing_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/viewed_controller.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/features/jobs/views/details/widgets/detail_article.dart';
import 'package:job_scraper/features/jobs/views/details/widgets/detail_description.dart';
import 'package:job_scraper/features/jobs/views/details/widgets/detail_info.dart';
import 'package:job_scraper/features/jobs/views/details/widgets/detail_sources.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final viewedController = ViewdController.instance;
    viewedController.storeViewedJob(job);

    final listingController = Get.put(ListingController());
    final dark = THelperFunctions.isDarkMode(context);
    ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: dark ? TColors.blacker : TColors.white,
      appBar: TAppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
        padding: const EdgeInsets.only(left: TSizes.md, right: TSizes.lg, top: TSizes.md, bottom: TSizes.sm),
        actions: [
          FavoriteJobIcon(job: job),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: TSizes.sm),
              child: Divider(
                thickness: 1, // Sets the thickness of the Divider to 2 pixels
                color: dark ? TColors.dark : TColors.grey, // Sets the color of the Divider to red
              ),
            ),
            DetailArticle(job: job),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems, vertical: TSizes.md),
              child: Divider(
                thickness: 1, // Sets the thickness of the Divider to 2 pixels
                color: dark ? TColors.dark : TColors.grey, // Sets the color of the Divider to red
              ),
            ),
            DetailInfo(job: job),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.spaceBtwItems, vertical: TSizes.md),
              child: Divider(
                thickness: 1, // Sets the thickness of the Divider to 2 pixels
                color: dark ? TColors.dark : TColors.grey, // Sets the color of the Divider to red
              ),
            ),
            DetailDescription(desc: job.description!),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          if (listingController.isApplied.value) {
            return DetailSources(listing: listingController.options);
          } else {
            return TButton(
              onPressed: () {
                listingController.getListings(job.jobId!);
              },
              child: listingController.isLoading.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(color: TColors.white),
                        const SizedBox(width: 24),
                        Text(
                          'PLEASE WAIT...',
                          style: Theme.of(context).textTheme.titleMedium!.apply(color: TColors.white),
                        ),
                      ],
                    )
                  : Text(
                      'APPLY JOB',
                      style: Theme.of(context).textTheme.titleLarge!.apply(color: TColors.white),
                    ),
            );
          }
        },
      ),
    );
  }
}
