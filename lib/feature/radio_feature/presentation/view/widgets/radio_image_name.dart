import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';

import '../radio_controller_page.dart';

class RadioImageWithName extends StatelessWidget {
  const RadioImageWithName({
    super.key,
    required this.widget,
  });

  final RadioControllerPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(16),
              color: AppConstant.backGroundColor),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset('assets/images/radio.png'),
          ),
        ),
        Text(
          widget.radioChannel.name,
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
