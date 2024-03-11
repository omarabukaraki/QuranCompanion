import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';

class SurahComponent extends StatelessWidget {
  const SurahComponent({super.key, this.name, this.number, this.onTap});
  final int? number;
  final String? name;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              name ?? 'سورة الفاتحة',
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
                    number.toString(),
                    style: TextStyle(fontSize: 20, height: -0.3),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
