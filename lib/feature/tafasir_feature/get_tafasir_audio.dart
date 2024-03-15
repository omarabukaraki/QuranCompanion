import 'package:quran_companion/core/api.dart';
import 'package:quran_companion/feature/tafasir_feature/tafasir_model.dart';

class GetTafasirAudio {
  Future<List<TafasirModel>> getTafasirAudio() async {
    String baseUrl = 'https://www.mp3quran.net/api/v3';

    Map<String, dynamic> data =
        await Api().get(url: '$baseUrl/tafsir', token: '');

    List<TafasirModel> tafasirData = [];
    for (var i = 0; i < data['tafasir']['soar'].length; i++) {
      tafasirData.add(TafasirModel.fromJson(data['tafasir']['soar'][i]));
    }

    return tafasirData;
  }
}
