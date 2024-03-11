import 'package:flutter/material.dart';

import 'constant.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.onChanged,
  });
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(16),
            color: AppConstant.backGroundColor),
        child: TextField(
          onChanged: onChanged,
          textAlign: TextAlign.right,
          cursorColor: Colors.black,
          decoration: const InputDecoration(
              hintText: 'أبحث عن الإذاعة',
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(16),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(16)))),
        ),
      ),
    );
  }
}
