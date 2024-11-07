class ListingModel {
  final String title;
  final String link;

  ListingModel({required this.title, required this.link});

  static ListingModel empty() => ListingModel(title: '', link: '');

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
    };
  }

  factory ListingModel.fromMap(Map<String, dynamic> data) {
    return ListingModel(
      title: data['title'] as String,
      link: data['link'] as String,
    );
  }
}
