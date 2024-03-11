import 'package:flutter/material.dart';
import '../../../../core/constant.dart';
import '../../../../core/custom_loading_ind.dart';
import '../view_model/get_radio_channel.dart';
import '../../data/model/radio_model.dart';
import 'radio_mobile_layout.dart';
import 'radio_tablet_layout.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.backGroundApplication,
      appBar: AppBar(
        backgroundColor: AppConstant.backGroundApplication,
      ),
      body: FutureBuilder<List<RadioModel>>(
        future: GetRadioChannel().getAllChannel(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<RadioModel> radioChannel = snapshot.data!;
            return LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 480) {
                  return RadioMobileLayout(radioChannel: radioChannel);
                } else {
                  return RadioTabletLayout(radioChannel: radioChannel);
                }
              },
            );
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}
