import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/radio_feature/data/model/radio_model.dart';
import 'widgets/custom_volume_button.dart';
import 'widgets/radio_image_name.dart';

class RadioControllerPage extends StatefulWidget {
  const RadioControllerPage({super.key, required this.radioChannel});

  final RadioModel radioChannel;

  @override
  State<RadioControllerPage> createState() => _RadioControllerPageState();
}

class _RadioControllerPageState extends State<RadioControllerPage> {
  final player = AudioPlayer();

  bool isPlay = true;
  double volume = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await player.stop();
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppConstant.backGroundApplication,
      ),
      backgroundColor: AppConstant.backGroundApplication,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RadioImageWithName(widget: widget),
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 3,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: 3,
                width: MediaQuery.of(context).size.width / 3,
                color: AppConstant.backGroundColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomVolumeButton(
                icon: Icons.remove,
                onTap: () async {
                  if (volume > 0) {
                    setState(() {
                      volume = volume - 0.5;
                    });
                  }
                  await player.setVolume(volume);
                },
              ),
              const SizedBox(width: 20),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isPlay = !isPlay;
                  });
                  isPlay == false
                      ? await player.play(UrlSource(widget.radioChannel.url))
                      : await player.pause();
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2),
                      borderRadius: BorderRadius.circular(50),
                      color: AppConstant.backGroundColor),
                  child: Center(
                      child: Icon(
                    isPlay != false ? Icons.play_arrow : Icons.pause,
                    size: 30,
                  )),
                ),
              ),
              const SizedBox(width: 20),
              CustomVolumeButton(
                icon: Icons.add,
                onTap: () async {
                  if (volume < 1) {
                    setState(() {
                      volume = volume + 0.5;
                    });
                  }
                  await player.setVolume(volume);
                },
              ),
            ],
          ),
          const SizedBox()
        ],
      ),
    );
  }
}
