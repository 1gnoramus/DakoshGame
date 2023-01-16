// ignore_for_file: prefer_const_constructors

import 'package:dakosh/cubit/dialogue/dialogue_cubit.dart';
import 'package:dakosh/flame_layer/flame_layer.dart';
import 'package:dakosh/flutter_layer/flutter_layer.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flame_layer/dakosha_game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscapeLeftOnly();
  Flame.device.fullScreen();
  runApp(
    DakoshaApp(),
  );
}

class DakoshaApp extends StatelessWidget {
  const DakoshaApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider<DialogueCubit>(
          create: (context) => DialogueCubit(),
          child: Stack(
            children: const [FlameLayer(), FlutterLayer()],
          ),
        ),
      ),
    );
  }
}
