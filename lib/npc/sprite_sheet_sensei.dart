import 'package:bonfire/bonfire.dart';

class SenseiSpriteSheet {
  static Future<SpriteAnimation> get idle => SpriteAnimation.load(
    "maps/sensei.png",
    SpriteAnimationData.sequenced(
      amount: 2,
      stepTime: 1,
      textureSize: Vector2(16, 20),
    ),
  );

  static SimpleDirectionAnimation get simpleDirectionAnimation =>
      SimpleDirectionAnimation(
        idleRight: idle,
        runRight: idle,
      );
}


