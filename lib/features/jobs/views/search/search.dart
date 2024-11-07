import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/controllers/search/job_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/recent_search_controller.dart';
import 'package:job_scraper/features/jobs/views/results/results.dart';
import 'package:job_scraper/features/jobs/views/search/widgets/search_form_field.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = JobSearchController.instance;
    final recentController = RecentSearchController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? TColors.blacker : TColors.white,
      body: Obx(
        () => Column(
          children: [
            const SizedBox(height: TSizes.spaceBtwSections),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.searchController.value.clear();
                      controller.searchQuery.value = '';
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: dark ? TColors.white : TColors.black,
                      size: TSizes.lg,
                    ),
                  ),
                  Expanded(
                    child: SearchFormField(
                      hint: 'Search',
                      autofocus: true,
                      controller: controller.searchController.value,
                      filled: true,
                      onChanged: (value) {
                        controller.searchQuery.value = controller.searchController.value.text;
                      },
                      onFieldSubmitted: (value) {
                        recentController.storeRecentSearch(value);
                        controller.searchJobs(value);
                        Get.to(() => const ResultsScreen());
                      },
                    ),
                  ),
                  if (controller.searchQuery.value.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        controller.searchController.value.clear();
                        controller.searchQuery.value = '';
                      },
                      child: Icon(
                        Icons.cancel_sharp,
                        color: dark ? TColors.white : TColors.black,
                        size: TSizes.lg,
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: TSizes.xs, bottom: TSizes.md),
              child: Divider(
                thickness: 1, // Sets the thickness of the Divider to 2 pixels
                color: dark ? TColors.dark : TColors.grey, // Sets the color of the Divider to red
              ),
            ),
            if (recentController.recentSearchs.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Search history', style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.darkGrey)),
                    const SizedBox(height: TSizes.md),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      padding: EdgeInsets.zero,
                      itemCount: recentController.recentSearchs.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 20),
                      itemBuilder: (context, index) {
                        var search = recentController.recentSearchs[index];
                        return InkWell(
                          onTap: () {
                            controller.searchQuery.value = search;
                            controller.searchJobs(search);
                            Get.to(() => const ResultsScreen());
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.history,
                                color: TColors.darkGrey,
                                size: TSizes.lg,
                              ),
                              const SizedBox(
                                width: TSizes.md,
                              ),
                              Expanded(
                                child: Text(
                                  search,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                              const Icon(
                                Icons.call_made_outlined,
                                color: TColors.darkGrey,
                                size: TSizes.lg,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
