import 'package:dakosh/cubit/dialogue/dialogue_cubit.dart';
import 'package:dakosh/flame_layer/dakosha_game.dart';
import 'package:flame/game.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlameLayer extends StatelessWidget {
  const FlameLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: DakoshaGame(context.read<DialogueCubit>()),
    );
  }
}
