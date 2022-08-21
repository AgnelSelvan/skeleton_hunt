import 'package:flame/sprite.dart';
import 'package:flame_mini_sprite/flame_mini_sprite.dart';
import 'package:flutter/material.dart';
import 'package:halloween_hunt/assets/sprites.dart';
import 'package:mini_sprite/mini_sprite.dart';

class Assets {
  Assets._();

  static final Assets _instance = Assets._();

  static Assets get instance => _instance;

  late Map<String, Sprite> gameSprites;

  Future<void> load() async {
    final miniLibrary = MiniLibrary.fromDataString(library);
    gameSprites = await miniLibrary.toSprites(
      pixelSize: 10,
      color: Colors.white,
    );
  }
}
