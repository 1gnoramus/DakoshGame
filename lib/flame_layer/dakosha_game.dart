import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

class DakoshaGame extends FlameGame with TapDetector {
  SpriteComponent dakoshaComponent = SpriteComponent();
  SpriteComponent tylerComponent = SpriteComponent();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    //add bg image
    add(
      SpriteComponent(
        size: size,
        sprite: await loadSprite('bgs/Street.png'),
      ),
    );
    //add char images
    Vector2 characterSize = Vector2(size.y * .77, size.x * .44);
    tylerComponent
      ..size = characterSize
      ..sprite = await loadSprite('characters/TylerSmile.webp')
      ..position = Vector2(55, 0);
    add(tylerComponent);
    dakoshaComponent
      ..size = characterSize
      ..sprite = await loadSprite('characters/DakoshaSmile.webp')
      ..position = Vector2(size.x * .55, 55);
    add(dakoshaComponent);

    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('music/bgMusic.wav', volume: 0.15);
  }

  @override
  void update(double dt) {
    if (dakoshaComponent.x > size.x / 2) {
      dakoshaComponent.x -= 100 * dt;
    }
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final rect = Rect.fromLTWH(0, size.y * .69, size.x, size.y * .33);
    canvas.drawRect(rect, Paint()..color = Color.fromARGB(140, 191, 190, 190));
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
  }
}
