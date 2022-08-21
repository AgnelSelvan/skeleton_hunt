import 'package:flame/components.dart';
import 'package:halloween_hunt/assets/assets.dart';
import 'package:halloween_hunt/views/game/halloween_hunt.dart';

class Utils {
  static int getHealthScore(String healthText) {
    String health = healthText.split("\n")[0];
    health = health.split(":").last;

    return (int.tryParse(health.replaceAll("%", "")) ?? 0);
  }

  static String updateHealthScore(String healthText) {
    int health = getHealthScore(healthText);
    health = health - 10;
    final String scoreText = healthText.split("\n").last;
    return "Health: $health%\n$scoreText";
  }

  static int getScore(String healthText) {
    String score = healthText.split("\n").last;
    score = score.split(":").last;

    return (int.tryParse(score) ?? 0);
  }

  static String updateScore(String healthText) {
    int score = getScore(healthText);
    score = score + 10;
    final String health = healthText.split("\n").first;
    return "$health\nScore: $score";
  }

  static SpriteAnimationComponent getIdleAnimation() {
    final idle1Sprite = Assets.instance.gameSprites['idle_1'];
    final idle2Sprite = Assets.instance.gameSprites['idle_2'];
    List<SpriteAnimationFrame> allIdleSpriteAnimation = [];
    if (idle1Sprite != null) {
      allIdleSpriteAnimation.add(SpriteAnimationFrame(idle1Sprite, 0.5));
    }
    if (idle2Sprite != null) {
      allIdleSpriteAnimation.add(SpriteAnimationFrame(idle2Sprite, 0.5));
    }

    return SpriteAnimationComponent(
      animation: SpriteAnimation(
        allIdleSpriteAnimation,
        loop: true,
      ),
      size: Vector2.all(tileSize),
      anchor: Anchor.center,
    );
  }

  static SpriteAnimationComponent getWalkingAnimation() {
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

  static SpriteAnimationComponent getAttackAnimation() {
    final enemy1Sprite = Assets.instance.gameSprites['enemy_1'];
    final enemy2Sprite = Assets.instance.gameSprites['enemy_2'];
    final enemy3Sprite = Assets.instance.gameSprites['enemy_3'];
    final enemy4Sprite = Assets.instance.gameSprites['enemy_4'];
    List<SpriteAnimationFrame> allenemySpriteAnimation = [];
    if (enemy1Sprite != null) {
      allenemySpriteAnimation.add(SpriteAnimationFrame(enemy1Sprite, 0.5));
    }
    if (enemy2Sprite != null) {
      allenemySpriteAnimation.add(SpriteAnimationFrame(enemy2Sprite, 0.5));
    }

    if (enemy3Sprite != null) {
      allenemySpriteAnimation.add(SpriteAnimationFrame(enemy3Sprite, 0.5));
    }
    if (enemy4Sprite != null) {
      allenemySpriteAnimation.add(SpriteAnimationFrame(enemy4Sprite, 0.5));
    }

    return SpriteAnimationComponent(
      animation: SpriteAnimation(
        allenemySpriteAnimation,
        loop: true,
      ),
      size: Vector2.all(tileSize),
      anchor: Anchor.center,
    );
  }

  static SpriteAnimationComponent getDeadAnimation() {
    final dead1Sprite = Assets.instance.gameSprites['dead_1'];
    final dead2Sprite = Assets.instance.gameSprites['dead_2'];
    final dead3Sprite = Assets.instance.gameSprites['dead_3'];
    final dead4Sprite = Assets.instance.gameSprites['dead_4'];
    final dead5Sprite = Assets.instance.gameSprites['dead_5'];
    final dead6Sprite = Assets.instance.gameSprites['dead_6'];
    List<SpriteAnimationFrame> alldeadSpriteAnimation = [];
    if (dead1Sprite != null) {
      alldeadSpriteAnimation.add(SpriteAnimationFrame(dead1Sprite, 0.1));
    }
    if (dead2Sprite != null) {
      alldeadSpriteAnimation.add(SpriteAnimationFrame(dead2Sprite, 0.1));
    }

    if (dead3Sprite != null) {
      alldeadSpriteAnimation.add(SpriteAnimationFrame(dead3Sprite, 0.1));
    }
    if (dead4Sprite != null) {
      alldeadSpriteAnimation.add(SpriteAnimationFrame(dead4Sprite, 0.1));
    }
    if (dead5Sprite != null) {
      alldeadSpriteAnimation.add(SpriteAnimationFrame(dead5Sprite, 0.1));
    }
    if (dead6Sprite != null) {
      alldeadSpriteAnimation.add(SpriteAnimationFrame(dead6Sprite, 0.1));
    }

    return SpriteAnimationComponent(
      animation: SpriteAnimation(
        alldeadSpriteAnimation,
        loop: false,
      ),
      removeOnFinish: true,
      size: Vector2.all(tileSize),
      anchor: Anchor.center,
    );
  }
}
