import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:halloween_hunt/assets/assets.dart';
import 'package:halloween_hunt/views/game/halloween_hunt.dart';

class Tile extends BodyComponent<HalloweenHunt> {
  Tile({
    required this.initialPosition,
    required this.sprite,
  });

  final Vector2 initialPosition;
  final String sprite;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(
      SpriteComponent(
        sprite: Assets.instance.gameSprites[sprite],
        size: Vector2.all(tileSize),
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    renderBody = false;
    // debugMode = true;
    debugColor = Colors.red;
    final bodyDef = BodyDef(
      userData: this,
      type: BodyType.kinematic,
    )..position = initialPosition;

    return world.createBody(bodyDef)
      ..createFixtureFromShape(
        PolygonShape()
          ..setAsBoxXY(
            (tileSize / 2) * 0.8,
            (tileSize / 2) * 0.8,
          ),
      );
  }
}
