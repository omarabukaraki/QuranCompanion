import 'package:flutter/material.dart';

import 'constant.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: CircularProgressIndicator(
      color: AppConstant.backGroundColor,
    ));
  }
}
