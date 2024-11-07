import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';
import 'package:job_scraper/utils/popups/loaders.dart';

class FavoriteJobController extends GetxController {
  static FavoriteJobController get instance => Get.find();

  final RxList<JobModel> _favoriteJobs = <JobModel>[].obs;
  List<JobModel> get favoriteJobs => _favoriteJobs;

  @override
  void onInit() {
    _initFavoriteJobs();
    super.onInit();
  }

  Future<void> _initFavoriteJobs() async {
    final json = await TLocalStorage.instance().readData('favoriteJobs');
    if (json != null) {
      final storedFavorites = json as List<Object?>;
      _favoriteJobs.assignAll(storedFavorites.map((doc) => JobModel.fromMap(doc as Map<String, dynamic>)).toList());
    }
  }

  bool isFavorite(String jobId) => _favoriteJobs.any((job) => job.jobId == jobId);

  void toggleFavoriteJob(JobModel job) {
    final isPresent = isFavorite(job.jobId!);
    if (isPresent) {
      _favoriteJobs.removeWhere((element) => element.jobId == job.jobId);
      TLoaders.customToast(message: 'Job has been removed from the Favorites.');
    } else {
      _favoriteJobs.add(job);
      TLoaders.customToast(message: 'Job has been added to the Favorites.');
    }
    _saveFavoriteJobsToStorage();
  }

  void _saveFavoriteJobsToStorage() {
    TLocalStorage.instance().saveData('favoriteJobs', _favoriteJobs.map((element) => element.toJson()).toList());
  }
}

// class FavoriteJobController extends GetxController {
//   static FavoriteJobController get instance => Get.find();

//   final RxList<JobModel> favoriteJobs = <JobModel>[].obs;

//   @override
//   void onInit() {
//     initFavoriteJobs();
//     super.onInit();
//   }

//   void initFavoriteJobs() {
//     final json = TLocalStorage.instance().readData('favoriteJobs');
//     json.then((value) {
//       if (value != null) {
//         final storedFavourites = value as List<Object?>;
//         favoriteJobs.assignAll(storedFavourites.map((doc) => JobModel.fromMap(doc as Map<String, dynamic>)).toList());
//       }
//     });
//   }

//   bool isFavorite(String jobId) {
//     if (favoriteJobs.where((job) => job.jobId == jobId).toList().isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   void toggleFavoriteJob(JobModel job) {
//     if (!favoriteJobs.contains(job)) {
//       favoriteJobs.add(job);
//       saveFavoriteJobsToStorage();
//       TLoaders.customToast(message: 'Job has been added to the Favorites.');
//     } else {
//       favoriteJobs.remove(job);
//       saveFavoriteJobsToStorage();
//       favoriteJobs.refresh();
//       TLoaders.customToast(message: 'Job has been removed from the Favorites.');
//     }
//   }

//   void saveFavoriteJobsToStorage() {
//     TLocalStorage.instance().saveData('favoriteJobs', favoriteJobs.map((element) => element.toJson()).toList());
//   }
// }
