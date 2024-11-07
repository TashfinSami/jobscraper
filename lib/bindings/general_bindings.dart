import 'package:get/get.dart';
import 'package:job_scraper/data/repositories/authentication_repository.dart';
import 'package:job_scraper/features/authentication/controllers/user_controller.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_job_controller.dart';
import 'package:job_scraper/features/jobs/controllers/favorites/favorite_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/recomended/recomended_controller.dart';
import 'package:job_scraper/features/jobs/controllers/search/job_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/recent_search_controller.dart';
import 'package:job_scraper/features/jobs/controllers/viewed/viewed_controller.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthenticationRepository());
    Get.put(UserController());
    Get.put(FavoriteJobController());
    Get.put(FavoriteSearchController());
    Get.put(ViewdController());
    Get.put(RecomendedController());
    Get.put(JobSearchController());
    Get.put(RecentSearchController());
  }
}
