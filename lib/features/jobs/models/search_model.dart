class SearchModel {
  final String q;
  final String? lrad;
  final String? chips;

  SearchModel({
    required this.q,
    this.lrad = '-1.0',
    this.chips = 'date_posted:month',
  });

  String get searchQuery =>
      'https://serpapi.com/search.json?engine=google_jobs&q=$q&hl=en&lrad=$lrad&chips=$chips&api_key=6685f61786911224738032b4e0168908e877cc369aeb5dd5609973b71615409f';
}
