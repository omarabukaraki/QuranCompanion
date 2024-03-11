import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';

import '../../data/model/quran_model.dart';

class SurahPage extends StatelessWidget {
  const SurahPage({super.key, required this.surah});
  final SurahModel surah;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            surah.name,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontFamily: 'almushaf',
              fontSize: 28,
            ),
          ),
          backgroundColor: AppConstant.backGroundApplication),
      backgroundColor: AppConstant.backGroundApplication,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(16),
            color: AppConstant.backGroundColor),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemCount: surah.ayahs.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppConstant.backGroundApplication),
                      child: ListTile(
                        leading: SizedBox(
                            width: 30,
                            height: 30,
                            child: Stack(
                              alignment: const Alignment(0, 0),
                              children: [
                                Image.asset(
                                  'assets/images/frame.png',
                                  fit: BoxFit.cover,
                                ),
                                Text(
                                  surah.ayahs[index].numberInSurah.toString(),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      height: -0.3,
                                      overflow: TextOverflow.visible),
                                ),
                              ],
                            )),
                        title: Text(
                          surah.ayahs[index].text,
                          style: const TextStyle(
                              fontSize: 24, fontFamily: 'almushaf'),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    );
                  },
                ),
              ],
            )),
      ),
    );
  }
}
