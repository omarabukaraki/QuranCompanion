import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_companion/feature/radio_feature/presentation/view/widgets/radio_component.dart';
import 'package:quran_companion/feature/radio_feature/data/model/radio_model.dart';

import 'radio_controller_page.dart';

class RadioMobileLayout extends StatefulWidget {
  const RadioMobileLayout({
    super.key,
    required this.radioChannel,
  });

  final List<RadioModel> radioChannel;

  @override
  State<RadioMobileLayout> createState() => _RadioMobileLayoutState();
}

class _RadioMobileLayoutState extends State<RadioMobileLayout> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: widget.radioChannel.length,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return RadioControllerPage(
                      radioChannel: widget.radioChannel[index]);
                },
              ));
            },
            child: RadioComponent(
              name: widget.radioChannel[index].name,
            ));
      },
    );
  }
}
