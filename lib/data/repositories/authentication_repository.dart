import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/views/onboarding/onboarding.dart';
import 'package:job_scraper/navigation_menu.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  @override
  void onReady() {
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final json = await TLocalStorage.instance().readData('IsFirstTime');
    if (json != null) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(const OnBoardingScreen());
    }
  }
}
