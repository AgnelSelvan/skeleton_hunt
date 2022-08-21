import 'dart:async' as async;

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/services.dart';
import 'package:halloween_hunt/utils/utils.dart';
import 'package:halloween_hunt/views/game/entities/enemy.dart';
import 'package:halloween_hunt/views/game/halloween_hunt.dart';
import 'package:halloween_hunt/views/menu/pause.dart';

class Player extends BodyComponent<HalloweenHunt> with ContactCallbacks {
  Player({
    required this.initialPosition,
  });

  final Vector2 initialPosition;

  static const double speed = 6;
  static const double jumpForce = 8;

  // late SpriteComponent sprite;
  late SpriteAnimationComponent currentAnimatedSprite;
  // late SpriteAnimationComponent walkAnimatedSprite;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // sprite = SpriteComponent(
    //   sprite: idle2Sprite,
    //   size: Vector2.all(tileSize),
    //   anchor: Anchor.center,
    // );

    currentAnimatedSprite = Utils.getIdleAnimation();

    await add(currentAnimatedSprite);
    // print(idleAnimatedSprite.playing);
    await add(
      KeyboardListenerComponent(
        keyUp: {
          LogicalKeyboardKey.space: _jump,
          LogicalKeyboardKey.keyA: _stopMoving,
          LogicalKeyboardKey.keyD: _stopMoving,
        },
        keyDown: {
          LogicalKeyboardKey.keyA: _startMovingLeft,
          LogicalKeyboardKey.keyD: _startMovingRight,
          LogicalKeyboardKey.keyW: _startAttack,
          LogicalKeyboardKey.keyR: _pauseMenu,
        },
      ),
    );
  }

  bool _pauseMenu(_) {
    gameRef.pauseEngine();
    gameRef.overlays.add(PauseMenu.ID);
    return true;
  }

  bool _jump(_) {
    if (!isOut) {
      FlameAudio.play('jump.wav', volume: 0.4);
      if (body.linearVelocity.y == 0) {
        body.applyLinearImpulse(Vector2(0, -jumpForce));
      }
    }
    return true;
  }

  bool _startMovingLeft(_) {
    currentAction = PlayerAction.walk;
    if (!isOut) {
      if (body.linearVelocity.x > -speed) {
        body.applyLinearImpulse(Vector2(-speed, 0));
        remove(currentAnimatedSprite);
        currentAnimatedSprite = Utils.getWalkingAnimation();
        add(currentAnimatedSprite);
      }

      if (!currentAnimatedSprite.isFlippedHorizontally) {
        currentAnimatedSprite.flipHorizontally();
      }
    }

    return true;
  }

  bool _startMovingRight(_) {
    currentAction = PlayerAction.walk;
    if (!isOut) {
      // print(
      //     "${body.linearVelocity.x < speed}, ${body.linearVelocity.x}, $speed");
      if (body.linearVelocity.x < speed) {
        body.applyLinearImpulse(Vector2(speed, 0));
        remove(currentAnimatedSprite);
        currentAnimatedSprite = Utils.getWalkingAnimation();
        add(currentAnimatedSprite);
      }
      if (currentAnimatedSprite.isFlippedHorizontally) {
        currentAnimatedSprite.flipHorizontally();
      }
    }

    return true;
  }

  bool _startAttack(_) {
    currentAction = PlayerAction.attack;
    if (!isOut) {
      remove(currentAnimatedSprite);
      currentAnimatedSprite = Utils.getAttackAnimation();
      add(currentAnimatedSprite);
    }
    return true;
  }

  bool _stopMoving(_) {
    if (!isOut) {
      remove(currentAnimatedSprite);
      currentAnimatedSprite = Utils.getIdleAnimation();
      add(currentAnimatedSprite);
      body.applyLinearImpulse(Vector2(-body.linearVelocity.x, 0));
    }
    return true;
  }

  @override
  Body createBody() {
    renderBody = false;
    // debugMode = true;
    final bodyDef = BodyDef(
      userData: this,
      type: BodyType.dynamic,
    )..position = initialPosition;

    return world.createBody(bodyDef)
      ..createFixtureFromShape(
        PolygonShape()..setAsBoxXY(tileSize / 5, tileSize / 2),
      );
  }

  bool isOut = false;

  @override
  void update(double dt) {
    // print("isOut: $isOut ${currentAnimatedSprite.playing}");
    if (!isOut) {
      if (Utils.getHealthScore(gameRef.healthText.text) <= 0) {
        isOut = true;
        FlameAudio.play('game_over.wav', volume: 0.4);

        remove(currentAnimatedSprite);
        currentAnimatedSprite = Utils.getDeadAnimation();
        add(currentAnimatedSprite);
        async.Timer(const Duration(seconds: 1), () {
          removeFromParent();
        });
      }
    }

    // print("body.force  ${body.force}");

    super.update(dt);
  }

  PlayerAction currentAction = PlayerAction.idle;

  @override
  void beginContact(Object other, Contact contact) {
    if (other is Enemy) {
      if (currentAction != PlayerAction.attack) {
        if (other.isAlive) {
          gameRef.healthText.text =
              Utils.updateHealthScore(gameRef.healthText.text);
        }
      }
    }
    super.endContact(other, contact);
  }
}

enum PlayerAction {
  walk,
  idle,
  attack,
}
