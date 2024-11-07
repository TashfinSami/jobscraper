import 'package:get/get.dart';
import 'package:job_scraper/features/authentication/models/user_model.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final Rx<UserModel> _user = UserModel.empty().obs;
  UserModel get user => _user.value;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  Future<void> fetchUserRecord() async {
    final json = await TLocalStorage.instance().readData('user');
    if (json != null) {
      final storedUser = json as Map<String, Object?>;
      _user(UserModel.fromMap(storedUser as Map<String, dynamic>));
    }
  }

  void storeUser(UserModel user) {
    final isPresent = _user.value == user;
    if (!isPresent) {
      _user(user);
      _saveUserToStorage();
    }
  }

  void _saveUserToStorage() {
    TLocalStorage.instance().saveData('user', _user.value.toJson());
  }
}
