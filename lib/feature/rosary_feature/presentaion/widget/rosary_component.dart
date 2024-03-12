import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';

class RosaryComponent extends StatelessWidget {
  const RosaryComponent({super.key, this.counter, this.onTap, this.label});
  final String? label;
  final VoidCallback? onTap;
  final int? counter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label ?? 'استغفر الله',
          style: const TextStyle(fontFamily: 'almushaf', fontSize: 24),
        ),
        Container(
          margin: const EdgeInsets.all(16),
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.width / 2.2,
          decoration: BoxDecoration(
              color: AppConstant.backGroundColor,
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(16)),
          child: Column(children: [
            Expanded(
                child: Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppConstant.backGroundApplication,
                        border: Border.all(width: 3),
                        borderRadius: BorderRadius.circular(16)),
                    child: Text(
                      counter.toString(),
                      style: const TextStyle(fontSize: 24),
                    ))),
            Expanded(
                child: SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: onTap,
                child: const Stack(
                  alignment: Alignment(0, 0),
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: AppConstant.backGroundApplication,
                        radius: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ]),
        ),
      ],
    );
  }
}
