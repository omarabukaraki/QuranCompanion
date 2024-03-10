import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';

class CustomVolumeButton extends StatelessWidget {
  const CustomVolumeButton({super.key, this.onTap, required this.icon});
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(width: 2),
            borderRadius: BorderRadius.circular(50),
            color: AppConstant.backGroundColor),
        child: Center(
            child: Icon(
          icon,
          size: 20,
        )),
      ),
    );
  }
}
