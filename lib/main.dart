import 'package:flutter/material.dart';
import 'package:job_scraper/app.dart';
import 'package:job_scraper/utils/local_storage/storage_utility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TLocalStorage.init('sembast');
  runApp(const App());
}
