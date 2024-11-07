import 'package:get/get.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

class RecentSearchController extends GetxController {
  static RecentSearchController get instance => Get.find();

  final RxList<String> _recentSearchs = <String>[].obs;
  List<String> get recentSearchs => _recentSearchs;

  @override
  void onInit() {
    _initRecentSearchs();
    super.onInit();
  }

  Future<void> _initRecentSearchs() async {
    final json = await TLocalStorage.instance().readData('recentSearchs');
    if (json != null) {
      final storedRecents = json as List<Object?>;
      _recentSearchs.assignAll(storedRecents.map((e) => e.toString()).toList());
    }
  }

  void storeRecentSearch(String search) {
    final isPresent = _recentSearchs.contains(search);
    if (!isPresent) {
      _recentSearchs.add(search);
      if (_recentSearchs.length > 5) {
        _recentSearchs.removeAt(0);
      }
      _saveRecentSearchsToStorage();
    }
  }

  void _saveRecentSearchsToStorage() {
    TLocalStorage.instance().saveData('recentSearchs', _recentSearchs);
  }
}
