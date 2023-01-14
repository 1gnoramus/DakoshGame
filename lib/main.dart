import 'package:dakosh/flutter_layer/flutter_layer.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import 'flame_layer/dakosha_game.dart';

void main() {
  DakoshaGame game = DakoshaGame();
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscapeLeftOnly();
  Flame.device.fullScreen();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(
              game: game,
            ),
            const FlutterLayer()
          ],
        ),
      ),
    ),
  );
}
