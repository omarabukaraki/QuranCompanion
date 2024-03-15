class TafasirModel {
  final int id;
  final int suraId;
  final int tafsirId;
  final String url;
  final String name;

  TafasirModel({
    required this.id,
    required this.suraId,
    required this.tafsirId,
    required this.url,
    required this.name,
  });

  factory TafasirModel.fromJson(Map<String, dynamic> json) => TafasirModel(
        id: json["id"],
        suraId: json["sura_id"],
        tafsirId: json["tafsir_id"],
        url: json["url"],
        name: json["name"],
      );
}
