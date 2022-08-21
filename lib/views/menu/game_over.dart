import 'package:flutter/material.dart';
import 'package:halloween_hunt/views/game/halloween_hunt.dart';

class GameOverMenu extends StatelessWidget {
  final HalloweenHunt gameRef;
  static const String ID = "GameOverMenu";
  const GameOverMenu({Key? key, required this.gameRef}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.black,
              width: 300,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Game Over",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        gameRef.overlays.remove(GameOverMenu.ID);
                        gameRef.reset();
                        gameRef.resumeEngine();
                      },
                      child: const Text("Restart"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
