import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/reciters_feature/data/model/reciters_model.dart';
import 'package:quran_companion/feature/reciters_feature/pretention/view_model/get_reciters.dart';
import 'package:quran_companion/home_page.dart';
import 'reciters_details_page.dart';

class RecitersPage extends StatelessWidget {
  const RecitersPage({super.key, this.name});
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
          future: GetReciters().getRecitersData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<RecitersModel> data = snapshot.data!;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CategoryComponent(
                    title: 'القارء',
                    image: 'assets/images/man.png',
                    name: data[index].name,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return RecitersDetailsPage(data: data[index]);
                        },
                      ));
                    },
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
        ));
  }
}
