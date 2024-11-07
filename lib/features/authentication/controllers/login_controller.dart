import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_scraper/features/authentication/controllers/user_controller.dart';
import 'package:job_scraper/features/authentication/models/user_model.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;

  void signIn() {
    userController.storeUser(UserModel(firstName: firstName.value.text, lastName: lastName.value.text));
  }
}
