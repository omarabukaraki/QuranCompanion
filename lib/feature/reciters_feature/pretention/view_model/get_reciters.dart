import 'package:quran_companion/core/api.dart';
import 'package:quran_companion/feature/reciters_feature/data/model/reciters_model.dart';

class GetReciters {
  Future<List<RecitersModel>> getRecitersData() async {
    String baseUrl = 'https://www.mp3quran.net/api/v3';

    Map<String, dynamic> data =
        await Api().get(url: '$baseUrl/reciters', token: '');

    List<RecitersModel> allData = [];

    for (var i = 0; i < data['reciters'].length; i++) {
      allData.add(RecitersModel.fromJson(data['reciters'][i]));
    }

    return allData;
  }
}
