import 'package:dakosh/data/storyline100.dart';
import 'package:dakosh/flame_layer/dialogue_component.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';

class DakoshaGame extends FlameGame with TapDetector {
  int dialogId = 101;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(DialogueComponent());

    // FlameAudio.bgm.initialize();
    // FlameAudio.bgm.play('music/bgMusic.wav', volume: 0.15);
  }

  @override
  void onTapDown(TapDownInfo info) {
    if (children.isNotEmpty) {
      removeAll(children);
    }
    if (dialogId - 101 < storyline100Dialogue.length - 1) {
      dialogId++;
    }
    add(DialogueComponent());
    super.onTapDown(info);
  }
}
