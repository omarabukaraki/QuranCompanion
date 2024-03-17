import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/quran_feature/presentation/view_model/get_quran_surah.dart';
import 'package:quran_companion/feature/quran_feature/data/model/quran_model.dart';

import '../../../../core/custom_loading_ind.dart';
import 'surah_page.dart';
import 'widget/surah_component.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key, this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(name ?? ''),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded))
        ],
        backgroundColor: AppConstant.backGroundApplication,
      ),
      backgroundColor: AppConstant.backGroundApplication,
      body: FutureBuilder(
        future: GetQuranSurah().getQuranSuwar(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SurahModel> suwarData = snapshot.data!;
            return ListView.builder(
              itemCount: suwarData.length,
              itemBuilder: (context, index) {
                return SurahComponent(
                  name: suwarData[index].name,
                  number: suwarData[index].number,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return SurahPage(surah: suwarData[index]);
                      },
                    ));
                  },
                );
              },
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
