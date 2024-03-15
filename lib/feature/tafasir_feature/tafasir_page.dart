import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/tafasir_feature/get_tafasir_audio.dart';
import 'package:quran_companion/feature/tafasir_feature/tafasir_controller_page.dart';
import 'package:quran_companion/feature/tafasir_feature/tafasir_model.dart';
import 'package:quran_companion/home_page.dart';

class TafasirPage extends StatelessWidget {
  const TafasirPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.backGroundApplication,
      ),
      backgroundColor: AppConstant.backGroundApplication,
      body: FutureBuilder(
        future: GetTafasirAudio().getTafasirAudio(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<TafasirModel> data = snapshot.data!;
            return GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return CategoryComponent(
                  image: 'assets/images/iman.png',
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TafasirControllerPage(data: data[index]);
                      },
                    ));
                  },
                  title: 'تفسير',
                  name: data[index].name,
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppConstant.backGroundColor,
              ),
            );
          }
        },
      ),
    );
  }
}
