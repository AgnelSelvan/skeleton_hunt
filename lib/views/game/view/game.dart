import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/navigator.dart' as ng;
import 'package:halloween_hunt/views/game/halloween_hunt.dart';
import 'package:halloween_hunt/views/menu/game_over.dart';
import 'package:halloween_hunt/views/menu/pause.dart';
import 'package:halloween_hunt/views/menu/win.dart';

class GameView extends StatelessWidget {
  const GameView({super.key, required this.stage});

  final int stage;

  static ng.Route<void> route(int stage) {
    return MaterialPageRoute(
      builder: (_) => GameView(
        stage: stage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        overlayBuilderMap: {
          GameOverMenu.ID: (BuildContext context, HalloweenHunt game) {
            return GameOverMenu(gameRef: game);
          },
          GameWinMenu.ID: (BuildContext context, HalloweenHunt game) {
            return GameWinMenu(gameRef: game);
          },
          PauseMenu.ID: (BuildContext context, HalloweenHunt game) {
            return PauseMenu(gameRef: game);
          }
        },
        game: HalloweenHunt(stage: stage),
      ),
    );
  }
}
