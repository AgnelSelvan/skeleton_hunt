import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:halloween_hunt/assets/assets.dart';
import 'package:halloween_hunt/assets/stages.dart';
import 'package:halloween_hunt/utils/utils.dart';
import 'package:halloween_hunt/views/game/entities/enemy.dart';
import 'package:halloween_hunt/views/menu/game_over.dart';
import 'package:halloween_hunt/views/menu/win.dart';
import 'package:mini_sprite/mini_sprite.dart';

import 'entities/entities.dart';

const double tileSize = 1;

class HalloweenHunt extends Forge2DGame
    with HasKeyboardHandlerComponents, HasGameRef {
  HalloweenHunt({required this.stage});

  final rng = Random(10);
  Player? player;
  static const double enemySpeed = 2;
  late TextComponent healthText;

  Future<void> initializeAllComponent() async {
    healthText = TextComponent(
      text: "Health: 100%\n Score: 0",
      position: Vector2(size.x - 10, 10),
      scale: Vector2.all(0.01),
    );
    healthText.anchor = Anchor.topRight;
    add(healthText);

    await loadStage(stages[stage]);
  }

  @override
  Future<void> onLoad() async {
    FlameAudio.bgm.initialize();
    FlameAudio.bgm.play('bgm.mp3', volume: 0.2);
    await initializeAllComponent();
  }

  final int stage;

  Future<void> loadStage(String stage) async {
    final miniMap = MiniMap.fromDataString(stage);

    for (final entry in miniMap.objects.entries) {
      // print(entry.value['sprite']);
      final sprite = entry.value['sprite'] as String?;
      // print(entry.key.x);
      final position = Vector2(
        entry.key.x.toDouble() * tileSize,
        entry.key.y.toDouble() * tileSize,
      );
      if (sprite == 'idle_1') {
        player = Player(initialPosition: position);
        unawaited(add(player!));
      } else if (sprite == 'enemy_1') {
        final enemy = Enemy(initialPosition: position);
        unawaited(add(enemy));
      } else if (sprite != null) {
        unawaited(add(Tile(initialPosition: position, sprite: sprite)));
      }
    }

    // camera.zoom = 20;
    // camera.snapTo(-size / 2);
  }

  SpriteAnimationComponent getWalkingAnimation() {
    final walk1Sprite = Assets.instance.gameSprites['walk_1'];
    final walk2Sprite = Assets.instance.gameSprites['walk_2'];
    final walk3Sprite = Assets.instance.gameSprites['walk_3'];
    final walk4Sprite = Assets.instance.gameSprites['walk_4'];

    List<SpriteAnimationFrame> allWalkSpriteAnimation = [];
    if (walk1Sprite != null) {
      allWalkSpriteAnimation.add(SpriteAnimationFrame(walk1Sprite, 0.08));
    }
    if (walk2Sprite != null) {
      allWalkSpriteAnimation.add(SpriteAnimationFrame(walk2Sprite, 0.08));
    }

    if (walk3Sprite != null) {
      allWalkSpriteAnimation.add(SpriteAnimationFrame(walk3Sprite, 0.08));
    }
    if (walk4Sprite != null) {
      allWalkSpriteAnimation.add(SpriteAnimationFrame(walk4Sprite, 0.08));
    }

    return SpriteAnimationComponent(
      animation: SpriteAnimation(
        allWalkSpriteAnimation,
        loop: true,
      ),
      size: Vector2.all(tileSize),
      anchor: Anchor.center,
    );
  }

  @override
  void update(double dt) {
    final allTile = children.whereType<Tile>().toList();
    allTile.sort((a, b) => a.body.position.x.compareTo(b.body.position.x));
    final allPlayers = children.whereType<Player>().toList();
    final allEnemies = children.whereType<Enemy>().toList();
    if (allPlayers.isNotEmpty) {
      camera.zoom = 60;
      // camera.followBodyComponent(allPlayers.first);
      // print(allPlayers.first.body.position);
      final playerPosition = allPlayers.first.body.position;

      // print(
      //     "firstTile.body.x${allTile.last.body.position.x} ${playerPosition.y}");
      camera.followComponent(PositionComponent(
        // position: playerPosition.y > 10.2
        //     ? Vector2(playerPosition.x, 10.2)
        //     : playerPosition,
        position: playerPosition,
        size: allPlayers.first.currentAnimatedSprite.size,
        scale: allPlayers.first.currentAnimatedSprite.scale,
      ));
      // print(playerPosition.y);
      if (playerPosition.y >= 70) {
        onGameOver();
      }
      healthText.position = camera.position + Vector2(2, 0.2);

      final player = allPlayers.first;

      if (allEnemies.isNotEmpty) {
        // final enemy = allEnemies.first;
        for (var enemy in allEnemies) {
          if (enemy.body.position.y >= 70) {
            remove(enemy);
          } else {
            if (enemy.isAlive) {
              if (player.body.position.x > enemy.body.position.x) {
                if (enemy.currentAnimatedSprite.isFlippedHorizontally) {
                  enemy.currentAnimatedSprite.flipHorizontally();
                }
                if (enemy.body.linearVelocity.x < enemySpeed) {
                  enemy.body.applyForce(Vector2(enemySpeed, 0));
                }
              } else {
                if (!enemy.currentAnimatedSprite.isFlippedHorizontally) {
                  enemy.currentAnimatedSprite.flipHorizontally();
                }
                if (enemy.body.linearVelocity.x > -enemySpeed) {
                  enemy.body.applyForce(Vector2(-enemySpeed, 0));
                }
              }
            } else {
              if (!enemy.isAlive) {
                if (!enemy.scoreAdded) {
                  healthText.text = Utils.updateScore(healthText.text);
                  enemy.scoreAdded = true;
                }
              }
            }
          }
        }
      } else {
        win();
      }
    } else {
      if (Utils.getHealthScore(healthText.text) <= 0) {
        onGameOver();
      }
    }

    super.update(dt);
  }

  onGameOver() async {
    overlays.remove(GameWinMenu.ID);
    overlays.add(GameOverMenu.ID);
  }

  win() async {
    overlays.add(GameWinMenu.ID);
  }

  reset() {
    removeAll(children);
    initializeAllComponent();
  }
}
