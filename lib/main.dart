import 'package:flutter/material.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'home_page.dart';

void main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  runApp(const QuranCompanion());
}

class QuranCompanion extends StatelessWidget {
  const QuranCompanion({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'MASSIR',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
