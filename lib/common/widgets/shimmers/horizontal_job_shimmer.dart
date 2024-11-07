import 'package:flutter/material.dart';
import 'package:job_scraper/common/widgets/shimmers/shimmer.dart';
import 'package:job_scraper/utils/constants/sizes.dart';

class HorizontalJobShimmer extends StatelessWidget {
  const HorizontalJobShimmer({
    super.key,
    this.itemCount = 3,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      padding: const EdgeInsets.only(right: TSizes.defaultSpace),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: TSizes.spaceBtwItems);
      },
      itemBuilder: (_, index) => const ShimmerEffect(width: 330, height: 130),
    );
  }
}
