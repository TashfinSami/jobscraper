import 'package:flutter/material.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({
    super.key,
    required this.job,
  });

  final JobModel job;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: Column(
        children: [
          if (job.extensions != null && job.extensions!.length > 1)
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: TColors.secondary,
                  ),
                  child: const Icon(
                    Icons.access_time,
                    size: 36,
                    color: TColors.primary,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date Posted',
                        style: Theme.of(context).textTheme.titleSmall!.apply(color: TColors.darkGrey),
                      ),
                      const SizedBox(height: TSizes.sm),
                      Text(
                        job.extensions!.first,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(height: TSizes.md),
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: TColors.secondary,
                ),
                child: const Icon(
                  Icons.location_on,
                  size: 36,
                  color: TColors.primary,
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Location',
                      style: Theme.of(context).textTheme.titleSmall!.apply(color: TColors.darkGrey),
                    ),
                    const SizedBox(height: TSizes.sm),
                    Text(
                      job.location.trim(),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
