import 'package:flutter/material.dart';
import 'package:job_scraper/common/widgets/appbar/appbar.dart';
import 'package:job_scraper/features/jobs/views/favorites/widgets/favorite_searches.dart';
import 'package:job_scraper/features/jobs/views/favorites/widgets/favorite_vacancies.dart';
import 'package:job_scraper/features/jobs/views/favorites/widgets/favorites_bar.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: dark ? TColors.blacker : TColors.white,
        appBar: TAppBar(
          title: Text(
            'Favorites',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace, top: TSizes.sm, bottom: TSizes.md),
              child: FavoritesBar(
                tabs: [
                  Tab(
                    child: Center(
                      child: Text('Jobs'),
                    ),
                  ),
                  Tab(
                    child: Center(
                      child: Text('Saved'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FavoriteVacancies(),
                  FavoriteSearches(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
