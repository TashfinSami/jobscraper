import 'package:flutter/material.dart';
import 'package:job_scraper/features/jobs/views/home/widgets/home_header.dart';
import 'package:job_scraper/features/jobs/views/home/widgets/home_management.dart';
import 'package:job_scraper/features/jobs/views/home/widgets/home_recent.dart';
import 'package:job_scraper/features/jobs/views/home/widgets/home_recomended.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: dark ? TColors.black : TColors.pageBackground,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            // Header
            HomeHeader(),
            SizedBox(height: TSizes.spaceBtwSections * 0.7),

            // Managing Slice
            HomeManagement(),
            SizedBox(height: TSizes.spaceBtwSections),

            // Recomended Jobs
            HomeRecomended(),
            SizedBox(height: TSizes.spaceBtwSections),

            // Recent Jobs
            HomeRecent(),
          ],
        ),
      ),
    );
  }
}
