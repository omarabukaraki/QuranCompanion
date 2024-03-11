import 'package:quran_companion/core/api.dart';
import 'package:quran_companion/feature/radio_feature/data/model/radio_model.dart';

class GetRadioChannel {
  Future<List<RadioModel>> getAllChannel() async {
    String baseUrl = 'https://mp3quran.net/api/v3';
    Map<String, dynamic> data =
        await Api().get(url: '$baseUrl/radios', token: '');

    // print(data['radios'][132]['url']);

    List<RadioModel> radioList = [];

    for (int i = 0; i < data['radios'].length; i++) {
      radioList.add(RadioModel.fromJson(data['radios'][i]));
    }

    return radioList;
  }
}
