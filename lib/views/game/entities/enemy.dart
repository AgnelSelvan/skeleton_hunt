import 'dart:async' as async;

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:halloween_hunt/utils/utils.dart';
import 'package:halloween_hunt/views/game/entities/entities.dart';
import 'package:halloween_hunt/views/game/halloween_hunt.dart';

class Enemy extends BodyComponent<HalloweenHunt> with ContactCallbacks {
  Enemy({
    required this.initialPosition,
  });

  final Vector2 initialPosition;

  static const double speed = 6;
  static const double jumpForce = 8;

  // late SpriteComponent sprite;
  late SpriteAnimationComponent currentAnimatedSprite;
  // late SpriteAnimationComponent enemyAnimatedSprite;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    currentAnimatedSprite = Utils.getAttackAnimation();
    await add(currentAnimatedSprite);
  }

  @override
  Body createBody() {
    renderBody = false;
    final bodyDef = BodyDef(
      userData: this,
      type: BodyType.dynamic,
    )..position = initialPosition;

    return world.createBody(bodyDef)
      ..createFixtureFromShape(
        PolygonShape()..setAsBoxXY(tileSize / 5, tileSize / 2),
      );
  }

  bool isAlive = true;
  bool scoreAdded = false;

  @override
  void beginContact(Object other, Contact contact) async {
    if (other is Player) {
      if (other.currentAction == PlayerAction.attack) {
        if (isAlive) {
          remove(currentAnimatedSprite);
          currentAnimatedSprite = Utils.getDeadAnimation();
          currentAnimatedSprite.removeOnFinish = true;

          await add(currentAnimatedSprite);
          isAlive = false;
          async.Timer(const Duration(seconds: 1), () {
            removeFromParent();
          });
        }
      }
    }
    super.beginContact(other, contact);
  }
}
