import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:halloween_hunt/assets/assets.dart';
import 'package:halloween_hunt/views/stage/stage.dart';

class MainMenuView extends StatelessWidget {
  const MainMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400,
                height: 200,
                alignment: Alignment.center,
                child: SpriteWidget(
                  sprite: Assets.instance.gameSprites['LOGO']!,
                ),
              ),
              const SizedBox(height: 64),
              const Text(
                "Skeleton Hunt",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                autofocus: true,
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => const StagesView()),
                      (route) => false);
                },
                child: const Text('Play'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showyKeyControlDialog(context);
                },
                child: const Text('Key Controls'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  showCreditsDialog(context);
                },
                child: const Text('Credits'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showCreditsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return const SimpleDialog(
            contentPadding: EdgeInsets.all(10),
            children: [
              SelectableText('''Skeleton Hunt Game
Kill all the Skeleton present in scene to complete the Level.

Created for Midyear 2022 Flame Game Jam

Controls
A - Move Left
D - Move Right
W - Attack
Space - Jump
R - Pause/Resume

Background Music
https://mixkit.co/free-sound-effects/video-game/

​Assets Used
Author : Agnel Selvan
Created Using: https://minisprit.es/#

​Fonts Used
https://www.fontspace.com/pixeloid-font-f69232​
​''')
            ],
          );
        });
  }

  showyKeyControlDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            contentPadding: const EdgeInsets.all(10),
            children: [
              Table(
                children: [
                  TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                      ),
                      children: const [
                        TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Key Controls"),
                        )),
                        TableCell(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Actions"),
                        ))
                      ]),
                  const TableRow(children: [
                    TableCell(child: Text("A")),
                    TableCell(child: Text("Move Left"))
                  ]),
                  const TableRow(children: [
                    TableCell(child: Text("D")),
                    TableCell(child: Text("Move Right"))
                  ]),
                  const TableRow(children: [
                    TableCell(child: Text("Space")),
                    TableCell(child: Text("Jump"))
                  ]),
                  const TableRow(children: [
                    TableCell(child: Text("W")),
                    TableCell(child: Text("Attack"))
                  ]),
                  const TableRow(children: [
                    TableCell(child: Text("R")),
                    TableCell(child: Text("Pause / Resume"))
                  ]),
                ],
              ),
            ],
          );
        });
  }
}
