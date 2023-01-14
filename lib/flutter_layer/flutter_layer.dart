import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                if (FlameAudio.bgm.isPlaying) {
                  FlameAudio.bgm.pause();
                } else {
                  FlameAudio.bgm.resume();
                }
              },
              icon: Icon(
                Icons.volume_up_rounded,
                color: Color(0xa0eaf2ef),
                size: 36,
              ),
            )
          ],
        ),
        Container(
          height: screenHeight * .3,
          width: screenWidth,
          color: Color(0xa0eaf2ef),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
              TypewriterAnimatedText(
                'dial',
                speed: const Duration(milliseconds: 140),
                textStyle: TextStyle(fontSize: 30, color: Color(0xFF521945)),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
