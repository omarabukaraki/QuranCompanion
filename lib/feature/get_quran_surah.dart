import 'package:quran_companion/core/api.dart';
import 'package:quran_companion/feature/quran_model.dart';

class GetQuranSurah {
  Future<List<SurahModel>> getQuranSuwar() async {
    String baseUrl = 'https://api.alquran.cloud/v1';

    Map<String, dynamic> data =
        await Api().get(url: '$baseUrl/quran/quran-uthmani', token: '');

    List<SurahModel> qData = [];

    for (var i = 0; i < data['data']['surahs'].length; i++) {
      qData.add(SurahModel.fromJson(data['data']['surahs'][i]));
    }

    return qData;
  }
}
