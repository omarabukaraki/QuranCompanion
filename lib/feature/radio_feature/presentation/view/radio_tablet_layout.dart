import 'package:flutter/material.dart';
import 'package:quran_companion/feature/radio_feature/presentation/view/widgets/radio_component.dart';
import '../../data/model/radio_model.dart';
import 'radio_controller_page.dart';

class RadioTabletLayout extends StatelessWidget {
  const RadioTabletLayout({
    super.key,
    required this.radioChannel,
  });

  final List<RadioModel> radioChannel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
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
