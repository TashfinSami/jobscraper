import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/views/login/login.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specific dot selected Page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  // Update Current Index & jump to the next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      TLocalStorage.instance().saveData('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  // Update Current Index & jump to the last Page
  void skipPage() {
    TLocalStorage.instance().saveData('IsFirstTime', false);
    Get.offAll(const LoginScreen());
  }
}
