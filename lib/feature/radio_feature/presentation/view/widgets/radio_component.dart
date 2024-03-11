import 'package:flutter/material.dart';
import '../../../../../core/constant.dart';

class RadioComponent extends StatelessWidget {
  const RadioComponent({
    Key? key,
    required this.name,
    this.onTap,
  }) : super(key: key);

  final String name;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 2,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.circular(16),
            color: AppConstant.backGroundColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                title: const Text(
                  'إذاعة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'MASSIR', fontSize: 23),
                ),
                subtitle: Text(
                  name.substring(6),
                  style: const TextStyle(fontFamily: 'MASSIR', fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                width: 110,
                height: 110,
                child: Image.asset(
                  'assets/images/radio.png',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
