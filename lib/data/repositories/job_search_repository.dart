import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/models/job_model.dart';
import 'package:job_scraper/features/jobs/models/search_model.dart';

class JobSearchRepository extends GetxController {
  static JobSearchRepository get instance => Get.find();

  Future<List<JobModel>> fetchJobs(String value) async {
    try {
      final search = SearchModel(q: value.replaceAll(' ', '+'));
      http.Response response = await http.get(Uri.parse(search.searchQuery));
      final parseData = json.decode(response.body);
      final jsonArray = parseData['jobs_results'];
      final list = jsonArray.map<JobModel>((doc) => JobModel.fromMap(doc)).toList();
      return list;
    } catch (e) {
      throw 'Something went wrong. fetchJobs()';
    }
  }
}
