import 'package:flutter/material.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/image_strings.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/helpers/helper_functions.dart';

class DetailArticle extends StatelessWidget {
  const DetailArticle({super.key, required this.job});

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  job.companyName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: TSizes.sm),
                Text(
                  job.title,
                  style: TextStyle(
                    height: 1.6,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: dark ? TColors.white : TColors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: TSizes.spaceBtwItems),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image(
                fit: BoxFit.contain,
                image: job.thumbnail != null ? NetworkImage(job.thumbnail!) : const AssetImage(TImages.companyLogoOrange) as ImageProvider,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
