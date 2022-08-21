import 'package:flutter/material.dart';
import 'package:halloween_hunt/assets/stages.dart';
import 'package:halloween_hunt/views/game/halloween_hunt.dart';
import 'package:halloween_hunt/views/game/view/game.dart';
import 'package:halloween_hunt/views/menu/main_menu.dart';

class GameWinMenu extends StatelessWidget {
  final HalloweenHunt gameRef;
  static const String ID = "GameWinMenu";
  const GameWinMenu({Key? key, required this.gameRef}) : super(key: key);

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
                    "You Won",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (gameRef.stage < (stages.length - 1))
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context, GameView.route(1), (route) => false);
                      },
                      child: const Text("Next Stage"),
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (gameRef.stage <= (stages.length - 1))
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainMenuView()),
                            (route) => false);
                      },
                      child: const Text("Main Menu"),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
