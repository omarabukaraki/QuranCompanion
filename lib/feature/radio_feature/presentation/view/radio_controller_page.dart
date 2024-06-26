import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
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
  bool isTheSoundSet = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  Future<void> setSound() async {
    await player.setAudioSource(
      AudioSource.uri(
        Uri.parse(widget.radioChannel.url),
        tag: MediaItem(
          id: widget.radioChannel.id.toString(),
          album: widget.radioChannel.name,
          title: widget.radioChannel.name,
          artUri: Uri.parse(widget.radioChannel.url),
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
            RadioImageWithName(
              name: widget.radioChannel.name,
            ),
            Column(children: [
              Slider(
                thumbColor: Colors.black,
                activeColor: AppConstant.backGroundColor,
                overlayColor: const MaterialStatePropertyAll(Colors.black),
                inactiveColor: const Color(0xff757575),
                max: position.inSeconds.toDouble(),
                min: 0,
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {},
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '',
                      style: TextStyle(fontFamily: ''),
                    ),
                    Text(
                      position.toString().substring(0, 7),
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
