import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/models/listing_model.dart';
import 'package:job_scraper/utils/constants/colors.dart';
import 'package:job_scraper/utils/constants/sizes.dart';
import 'package:job_scraper/utils/device/device_utility.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailSources extends StatelessWidget {
  const DetailSources({
    super.key,
    required this.listing,
  });

  final List<ListingModel> listing;
  // final ListingModel listing;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: TSizes.defaultSpace, top: TSizes.md, bottom: TSizes.defaultSpace),
        child: SizedBox(
          height: 50,
          child: ListView.separated(
            itemCount: listing.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: TSizes.defaultSpace),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: TSizes.sm);
            },
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () => launchUrlString(listing[index].link),
                child: Container(
                  width: listing.length > 1 ? null : (TDeviceUtils.getScreenWidth(context) - TSizes.defaultSpace * 2),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: TSizes.md, vertical: TSizes.sm),
                  decoration: BoxDecoration(
                    color: TColors.secondary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    listing[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    // return Padding(
    //   padding: const EdgeInsets.only(left: TSizes.defaultSpace),
    //   child: Flex(
    //     direction: Axis.horizontal,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Container(
    //         height: 40,
    //         alignment: Alignment.center,
    //         padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
    //         decoration: BoxDecoration(
    //           color: TColors.secondary,
    //           borderRadius: BorderRadius.circular(24),
    //         ),
    //         child: Text(
    //           listing.title,
    //           style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary),
    //         ),
    //       ),
    //       const Spacer(),
    //     ],
    //   ),
    // );
  }
}
