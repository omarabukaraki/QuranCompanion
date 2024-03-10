import 'dart:convert';

import 'package:quran_companion/feature/radio_feature/data/model/radio_model.dart';
import 'package:http/http.dart' as http;

class GetRadioChannel {
  // List<RadioModel>
  Future<List<RadioModel>> getAllChannel() async {
    String baseUrl = 'https://mp3quran.net/api/v3';

    http.Response response = await http.get(Uri.parse('$baseUrl/radios'));

    Map<String, dynamic> data = jsonDecode(response.body);
    print(data['radios'][132]['url']);

    List<RadioModel> radioList = [];

    for (int i = 0; i < data['radios'].length; i++) {
      radioList.add(RadioModel.fromJson(data['radios'][i]));
      // print(data['radios'][i]);
    }
    print(radioList);

    return radioList;
  }
}
