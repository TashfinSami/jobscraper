import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/search/job_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/recent_search_controller.dart';
import 'package:job_scraper/features/jobs/views/results/results.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class FavoriteSearches extends StatelessWidget {
  const FavoriteSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoriteSearchController.instance;
    final searchController = JobSearchController.instance;
    final recentController = RecentSearchController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: Obx(
        () => Container(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: ListView.separated(
            itemCount: controller.favoriteSearchs.length,
            shrinkWrap: true,
            reverse: true,
            padding: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: TSizes.spaceBtwItems);
            },
            itemBuilder: (BuildContext context, int index) {
              var search = controller.favoriteSearchs[index];
              return GestureDetector(
                onTap: () {
                  searchController.searchQuery.value = search;
                  recentController.storeRecentSearch(search);
                  searchController.searchJobs(search);
                  Get.to(() => const ResultsScreen());
                },
                child: Container(
                  height: 160,
                  padding: const EdgeInsets.only(left: TSizes.md, right: TSizes.md, top: 20, bottom: 10),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            search,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          GestureDetector(
                            onTap: () => controller.toggleFavoriteSearch(search),
                            child: Icon(
                              controller.isFavorite(search) ? Icons.bookmark : Icons.bookmark_border,
                              color: Colors.yellow,
                              size: TSizes.xl,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.sm),
                      Expanded(
                        child: Text(
                          'Anywhere, For last Month',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.darkGrey),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Switch(value: false, onChanged: (value) {}),
                          const SizedBox(width: TSizes.sm),
                          Expanded(
                            child: Text(
                              'Notifications On',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.more_vert),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
