import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/get_quran_surah.dart';
import 'package:quran_companion/feature/quran_model.dart';

import '../core/custom_loading_ind.dart';

class QuranPage extends StatelessWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

class SurahComponent extends StatelessWidget {
  const SurahComponent({super.key, this.name, this.number, this.onTap});
  final int? number;
  final String? name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(16),
            color: AppConstant.backGroundColor),
        child: Row(children: [
          Expanded(
            flex: 4,
            child: Text(
              name ?? 'سورة الفاتحة',
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontFamily: 'almushaf',
                fontSize: 28,
                height: -.5,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Stack(
                alignment: const Alignment(0, 0),
                children: [
                  Image.asset(
                    'assets/images/frame.png',
                    fit: BoxFit.cover,
                  ),
                  Text(
                    number.toString(),
                    style: TextStyle(fontSize: 20, height: -0.3),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

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
                                  style: TextStyle(
                                      fontSize: 16,
                                      height: -0.3,
                                      overflow: TextOverflow.visible),
                                ),
                              ],
                            )),
                        title: Text(
                          surah.ayahs[index].text,
                          style:
                              TextStyle(fontSize: 24, fontFamily: 'almushaf'),
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
