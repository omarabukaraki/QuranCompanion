import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/quran_feature/presentation/view/quran_page.dart';
import 'package:quran_companion/feature/radio_feature/presentation/view/radio_page.dart';
import 'feature/reciters_feature/pretention/view/reciters_page.dart';
import 'feature/rosary_feature/pretention/view/rosary_page.dart';
import 'feature/tafasir_feature/tafasir_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppConstant.backGroundApplication),
      backgroundColor: AppConstant.backGroundApplication,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              CategoryComponent(
                name: 'إذاعات القران الكريم',
                onTap: () async {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const RadioPage(
                        name: 'إذاعات القران الكريم',
                      );
                    },
                  ));
                },
              ),
              CategoryComponent(
                image: 'assets/images/quran.png',
                name: 'القران الكريم',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const QuranPage(
                        name: 'القران الكريم',
                      );
                    },
                  ));
                },
              ),
              CategoryComponent(
                image: 'assets/images/iman.png',
                name: 'تفسير القران الكريم',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const TafasirPage(name: 'تفسير القران الكريم');
                    },
                  ));
                },
              ),
              CategoryComponent(
                image: 'assets/images/man.png',
                name: 'قراء القران',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const RecitersPage(
                        name: 'قراء القران',
                      );
                    },
                  ));
                },
              ),
              CategoryComponent(
                image: 'assets/images/arabic.png',
                name: 'خاتم التسبيح',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const RosaryPage(name: 'خاتم التسبيح');
                    },
                  ));
                },
              )
            ]),
      ),
    );
  }
}

class CategoryComponent extends StatelessWidget {
  const CategoryComponent(
      {super.key, this.image, this.name, this.onTap, this.title});
  final String? name;
  final VoidCallback? onTap;
  final String? image;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(16),
            color: AppConstant.backGroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  title ?? 'قائمة',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontFamily: 'MASSIR', fontSize: 23),
                ),
                subtitle: Text(
                  name ?? '',
                  style: const TextStyle(fontFamily: 'MASSIR', fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 110,
                height: 110,
                child: Image.asset(
                  image ?? 'assets/images/radio.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
