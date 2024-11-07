import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/search/job_search_controller.dart';
import 'package:job_scraper/common/widgets/job_list/job_list_builder.dart';
import 'package:job_scraper/features/jobs/views/results/widgets/result_list.dart';
import 'package:job_scraper/features/jobs/views/search/search.dart';
import 'package:job_scraper/navigation_menu.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = JobSearchController.instance;
    final bookmarkController = FavoriteSearchController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? TColors.blacker : TColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Obx(
          () => Column(
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),

              // SearchBar
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.searchController.value.clear();
                      controller.searchQuery.value = '';
                      Get.to(() => const NavigationMenu());
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: dark ? TColors.white : TColors.black,
                      size: TSizes.lg,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
                      child: InkWell(
                        onTap: () => Get.to(() => const SearchScreen()),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: TColors.grey),
                          ),
                          child: Text(
                            controller.searchQuery.value,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => bookmarkController.toggleFavoriteSearch(controller.searchQuery.value),
                    child: Icon(
                      bookmarkController.isFavorite(controller.searchQuery.value) ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.yellow,
                      size: TSizes.xl,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.defaultSpace),

              // Search Result
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Results',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: TSizes.xs),
                      if (!controller.isLoading.value)
                        Text(
                          '${controller.jobs.length} Job founded',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.darkGrey),
                        ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: ImageIcon(
                      const AssetImage(TImages.vBtnFilter),
                      color: dark ? TColors.white : TColors.black,
                      size: TSizes.lg,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Result List
              if (!controller.isLoading.value)
                Expanded(
                  child: SingleChildScrollView(
                    child: ResultList(
                      itemCount: controller.jobs.length,
                      itemBuilder: (_, index) => JobListBuilder(job: controller.jobs[index]),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
