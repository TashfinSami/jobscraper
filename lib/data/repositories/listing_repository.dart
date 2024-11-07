import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:job_scraper/features/jobs/models/listing_model.dart';

class ListingRepository extends GetxController {
  static ListingRepository get instance => Get.find();

  Future<List<ListingModel>> fetchListings(String jobId) async {
    try {
      final query =
          'https://serpapi.com/search.json?engine=google_jobs_listing&q=$jobId&api_key=6685f61786911224738032b4e0168908e877cc369aeb5dd5609973b71615409f';
      http.Response response = await http.get(Uri.parse(query));
      final parseData = json.decode(response.body);
      final jsonArray = parseData['apply_options'];
      final list = jsonArray.map<ListingModel>((doc) => ListingModel.fromMap(doc)).toList();
      return list;
    } catch (e) {
      throw "Google hasn't returned any results for this query. The job may have expired.";
    }
  }
}
