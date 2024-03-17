import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';

import '../widget/rosary_component.dart';

class RosaryPage extends StatefulWidget {
  const RosaryPage({super.key, this.name});
  final String? name;

  @override
  State<RosaryPage> createState() => _RosaryPageState();
}

class _RosaryPageState extends State<RosaryPage> {
  List<String> rosaryType = [
    'استغفر الله',
    'لا إله إلا الله',
    ' سبحان الله وبحمده',
    'الحمدلله',
    'لا حول ولا قوة الا بالله',
    'اللهم صل على سيدنا محمد'
  ];
  List<int> counters = [0, 0, 0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.name ?? ''),
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
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: GridView.builder(
            itemCount: rosaryType.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.8),
            itemBuilder: (context, index) {
              return RosaryComponent(
                counter: counters[index],
                label: rosaryType[index],
                onTap: () {
                  setState(() {
                    if (counters[index] == 99999999) {
                      counters[index] = 0;
                    } else {
                      counters[index]++;
                    }
                  });
                },
              );
            },
          ),
        ));
  }
}
