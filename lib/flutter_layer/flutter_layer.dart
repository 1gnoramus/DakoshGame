import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterLayer extends StatelessWidget {
  const FlutterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
            color: Colors.blueGrey,
            size: 36,
          ),
        )
      ],
    );
  }
}
