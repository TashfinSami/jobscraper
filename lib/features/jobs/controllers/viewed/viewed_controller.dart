import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

class ViewdController extends GetxController {
  static ViewdController get instance => Get.find();

  final RxList<JobModel> _viewedJobs = <JobModel>[].obs;
  List<JobModel> get viewedJobs => _viewedJobs;

  @override
  void onInit() {
    _initViewedJobs();
    super.onInit();
  }

  Future<void> _initViewedJobs() async {
    final json = await TLocalStorage.instance().readData('viewedJobs');
    if (json != null) {
      final storedViewedJobs = json as List<Object?>;
      _viewedJobs.assignAll(storedViewedJobs.map((doc) => JobModel.fromMap(doc as Map<String, dynamic>)).toList());
    }
  }

  void storeViewedJob(JobModel job) {
    final isPresent = _viewedJobs.contains(job);
    if (!isPresent) {
      _viewedJobs.add(job);
      _saveViewedJobsToStorage();
    }
  }

  void _saveViewedJobsToStorage() {
    TLocalStorage.instance().saveData('viewedJobs', _viewedJobs.map((element) => element.toJson()).toList());
  }

  void removeViewedJobsFromStorage(JobModel job) {
    _viewedJobs.remove(job);
    _saveViewedJobsToStorage();
  }
}
