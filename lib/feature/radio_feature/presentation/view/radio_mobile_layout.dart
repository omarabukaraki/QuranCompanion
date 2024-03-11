import 'package:flutter/material.dart';

import 'package:quran_companion/feature/radio_feature/presentation/view/widgets/radio_component.dart';
import 'package:quran_companion/feature/radio_feature/data/model/radio_model.dart';

import 'radio_controller_page.dart';

class RadioMobileLayout extends StatelessWidget {
  const RadioMobileLayout({
    super.key,
    required this.radioChannel,
  });

  final List<RadioModel> radioChannel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: radioChannel.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RadioControllerPage(radioChannel: radioChannel[index]);
                },
              ));
            },
            child: RadioComponent(
              name: radioChannel[index].name,
            ));
      },
    );
  }
}
