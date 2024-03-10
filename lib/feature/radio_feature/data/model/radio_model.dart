class RadioModel {
  final int id;
  final String name;
  final String url;
  final DateTime recentDate;

  RadioModel({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });

  factory RadioModel.fromJson(json) {
    return RadioModel(
      id: json["id"],
      name: json["name"],
      url: json["url"],
      recentDate: DateTime.parse(json["recent_date"]),
    );
  }
}
