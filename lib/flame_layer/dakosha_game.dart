import 'package:dakosh/cubit/dialogue/dialogue_cubit.dart';
import 'package:dakosh/data/storyline100.dart';
import 'package:dakosh/flame_layer/dialogue_component.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_bloc/flame_bloc.dart';

class DakoshaGame extends FlameGame with TapDetector {
  final DialogueCubit dialogueCubit;

  DakoshaGame(this.dialogueCubit);

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // add(DialogueComponent());
    await FlameMultiBlocProvider(providers: [
      FlameBlocProvider<DialogueCubit, DialogueState>.value(
          value: dialogueCubit),
    ], children: [
      DialogueComponent()
    ]);

    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('music/bgMusic.wav', volume: 0.15);
  }

  @override
  void onTapDown(TapDownInfo info) {
    if (children.isNotEmpty) {
      removeAll(children);
    }
    if (dialogueCubit.state.dialogueId - 101 <
        storyline100Dialogue.length - 1) {
      dialogueCubit.increaseDialogueId();
    }
    add(DialogueComponent());
    super.onTapDown(info);
  }
}
