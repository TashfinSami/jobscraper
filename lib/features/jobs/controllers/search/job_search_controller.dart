import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/data/repositories/job_search_repository.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/utils/popups/loaders.dart';

class JobSearchController extends GetxController {
  static JobSearchController get instance => Get.find();

  final isLoading = false.obs;
  final Rx<TextEditingController> searchController = TextEditingController().obs;
  final RxString searchQuery = "".obs;
  final RxList<JobModel> jobs = <JobModel>[].obs;

  Future<void> searchJobs(String value) async {
    try {
      isLoading.value = true;
      this.jobs.clear();

      final jobSearchRepo = Get.put(JobSearchRepository());
      final jobs = await jobSearchRepo.fetchJobs(value);

      this.jobs.assignAll(jobs);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
