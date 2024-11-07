import 'package:flutter/material.dart';
import 'package:job_scraper/common/widgets/shimmers/shimmer.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class VerticalJobShimmer extends StatelessWidget {
  const VerticalJobShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwSections),
      height: 130,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            ShimmerEffect(width: 120, height: 120),
            SizedBox(width: TSizes.spaceBtwItems),

            /// Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: TSizes.spaceBtwItems / 2),
                ShimmerEffect(width: 160, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                ShimmerEffect(width: 110, height: 15),
                SizedBox(height: TSizes.spaceBtwItems / 2),
                ShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
