import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

class RecomendedController extends GetxController {
  static RecomendedController get instance => Get.find();

  final RxList<JobModel> _recomendedJobs = <JobModel>[].obs;
  List<JobModel> get recomendedJobs => _recomendedJobs;
  final carouselCurrentIndex = 0.obs;

  @override
  void onInit() {
    _getRecomendedJobs();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  Future<void> _getRecomendedJobs() async {
    final json = await TLocalStorage.instance().readData('favoriteJobs');
    if (json != null) {
      final storedFavorites = json as List<Object?>;
      final list = storedFavorites.map((doc) => JobModel.fromMap(doc as Map<String, dynamic>)).toList();
      list.shuffle();
      int length = list.length > 3 ? 3 : list.length;
      for (var i = 0; i < length; i++) {
        _recomendedJobs.add(list[i]);
      }
    }
  }
}
