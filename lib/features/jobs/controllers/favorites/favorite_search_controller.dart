import 'package:get/get.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';
import 'package:job_scraper/utils/popups/loaders.dart';

class FavoriteSearchController extends GetxController {
  static FavoriteSearchController get instance => Get.find();

  final RxList<String> _favoriteSearchs = <String>[].obs;
  List<String> get favoriteSearchs => _favoriteSearchs;

  @override
  void onInit() {
    _initFavoriteSearchs();
    super.onInit();
  }

  Future<void> _initFavoriteSearchs() async {
    final json = await TLocalStorage.instance().readData('favoriteSearchs');
    if (json != null) {
      final storedFavorites = json as List<Object?>;
      _favoriteSearchs.assignAll(storedFavorites.map((e) => e.toString()).toList());
    }
  }

  bool isFavorite(String search) => _favoriteSearchs.contains(search);

  void toggleFavoriteSearch(String search) {
    final isPresent = _favoriteSearchs.contains(search);
    if (isPresent) {
      _favoriteSearchs.remove(search);
      TLoaders.customToast(message: 'Search has been removed from the Favorites.');
    } else {
      _favoriteSearchs.add(search);
      TLoaders.customToast(message: 'Search has been added to the Favorites.');
    }
    _saveFavoriteSearchsToStorage();
  }

  void _saveFavoriteSearchsToStorage() {
    TLocalStorage.instance().saveData('favoriteSearchs', _favoriteSearchs);
  }
}
