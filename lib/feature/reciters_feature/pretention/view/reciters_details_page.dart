import 'package:flutter/material.dart';
import '../../../../core/constant.dart';
import '../../data/model/reciters_model.dart';
import 'reciters_controller_page.dart';

class RecitersDetailsPage extends StatelessWidget {
  const RecitersDetailsPage({super.key, required this.data});
  final RecitersModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data.name),
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
      body: ListView.builder(
        itemCount: data.moshaf[0].surahTotal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return index < 9
                      ? RecitersControllerPage(
                          id: data.moshaf[0].id.toString(),
                          name: data.moshaf[0].name,
                          linkAudio:
                              ('${data.moshaf[0].server}/00${index + 1}.mp3')
                                  .toString(),
                        )
                      : index < 99
                          ? RecitersControllerPage(
                              id: data.moshaf[0].id.toString(),
                              name: data.moshaf[0].name,
                              linkAudio:
                                  ('${data.moshaf[0].server}/0${index + 1}.mp3')
                                      .toString(),
                            )
                          : RecitersControllerPage(
                              id: data.moshaf[0].id.toString(),
                              name: data.moshaf[0].name,
                              linkAudio:
                                  ('${data.moshaf[0].server}/${index + 1}.mp3')
                                      .toString(),
                            );
                },
              ));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                    data.moshaf[0].name,
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
                          (index + 1).toString(),
                          style: const TextStyle(fontSize: 20, height: -0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
