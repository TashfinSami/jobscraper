import 'package:get/get.dart';
import 'package:job_scraper/data/repositories/listing_repository.dart';
import 'package:job_scraper/features/jobs/models/listing_model.dart';
import 'package:job_scraper/utils/popups/loaders.dart';

class ListingController extends GetxController {
  static ListingController get instance => Get.find();

  final isLoading = false.obs;
  final RxList<ListingModel> options = <ListingModel>[].obs;
  final RxBool isApplied = false.obs;

  Future<void> getListings(String jobId) async {
    try {
      isLoading.value = true;
      this.options.clear();

      final listingRepo = Get.put(ListingRepository());
      final options = await listingRepo.fetchListings(jobId);

      this.options.assignAll(options);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isApplied.value = true;
      isLoading.value = false;
    }
  }
}
