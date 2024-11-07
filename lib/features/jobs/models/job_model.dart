class JobModel {
  late final String title;
  late final String companyName;
  late final String location;
  late final String? description;
  late final String? thumbnail;
  late final String? jobId;
  late final List? extensions;

  JobModel({
    required this.title,
    required this.companyName,
    this.description,
    required this.location,
    this.thumbnail,
    this.jobId,
    this.extensions,
  });

  static JobModel empty() => JobModel(title: '', companyName: '', location: '');

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'company_name': companyName,
      'description': description,
      'location': location,
      'thumbnail': thumbnail,
      'job_id': jobId,
      'extensions': extensions,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> data) {
    return JobModel(
      title: data['title'] as String,
      companyName: data['company_name'] as String,
      description: data['description'] as String?,
      jobId: data['job_id'] as String?,
      location: data['location'] as String,
      thumbnail: data['thumbnail'] as String?,
      extensions: data['extensions'] as List?,
    );
  }
}
