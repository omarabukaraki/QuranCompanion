import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:quran_companion/core/constant.dart';
import 'package:quran_companion/feature/tafasir_feature/tafasir_model.dart';

import '../radio_feature/presentation/view/widgets/custom_volume_button.dart';
import '../radio_feature/presentation/view/widgets/radio_image_name.dart';

class TafasirControllerPage extends StatefulWidget {
  const TafasirControllerPage({super.key, required this.data});

  final TafasirModel data;

  @override
  State<TafasirControllerPage> createState() => _TafasirControllerPageState();
}

class _TafasirControllerPageState extends State<TafasirControllerPage> {
  final player = AudioPlayer();

  bool isPlay = true;
  double volume = 1;
  bool isTheSoundSet = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  Future<void> setSound() async {
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(widget.data.url),
        tag: MediaItem(
          id: widget.data.id.toString(),
          album: widget.data.name,
          title: widget.data.name,
          artUri: Uri.parse(widget.data.url),
        ),
      ),
    );
  }

  @override
  void initState() {
    player.positionStream.listen((p) {
      setState(() {
        position = p;
      });
    });
    player.durationStream.listen((d) {
      setState(() {
        duration = d ?? const Duration();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
            RadioImageWithName(name: widget.data.name),
            Column(children: [
              Listener(
                onPointerMove: (event) {
                  setState(() {
                    position = player.position;
                    duration = player.duration!;
                  });
                },
                child: Slider(
                  thumbColor: Colors.black,
                  activeColor: AppConstant.backGroundColor,
                  overlayColor: const MaterialStatePropertyAll(Colors.black),
                  inactiveColor: const Color(0xff757575),
                  max: duration.inSeconds.toDouble(),
                  min: 0,
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    final positions = Duration(seconds: value.toInt());
                    await player.seek(positions);
                    setState(() {});
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      position.toString().substring(2, 7),
                      style: const TextStyle(fontFamily: ''),
                    ),
                    Text(
                      (duration).toString().substring(2, 7),
                      style: const TextStyle(fontFamily: ''),
                    )
                  ],
                ),
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
                      if (isTheSoundSet != true) {
                        await setSound();
                        isTheSoundSet = true;
                        await player.play();
                      } else {
                        isPlay == false
                            ? await player.play()
                            : await player.pause();
                      }
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
                      print(player.bufferedPosition);
                    },
                  ),
                ],
              ),
            ]),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
