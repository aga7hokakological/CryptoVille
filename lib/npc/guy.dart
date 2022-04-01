import 'package:bonfire/bonfire.dart';
import 'package:bonfire/enemy/enemy.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multibiomegame/main.dart';
import 'package:multibiomegame/npc/sprite_sheet_guy.dart';
import 'package:multibiomegame/npc/sprite_sheet_sensei.dart';
import 'package:multibiomegame/player/game_player.dart';

import '../player/sprite_sheet_hero.dart';
import '../util/custom_sprite_animation_widget.dart';


class HatGuy extends SimplePlayer with ObjectCollision, TapGesture {
  HatGuy(Vector2 position)
      : super(
    animation: HatGuySpriteSheet.simpleDirectionAnimation,
    position: position,
    size: Vector2.all(tileSize * 0.8),
    speed: tileSize * 1.6,
  ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              tileSize * 0.4,
              tileSize * 0.4,
            ),
            align: Vector2(
              tileSize * 0.2,
              tileSize * 0.4,
            ),
          ),
        ],
      ),
    );
  }

  void execShowTalk(GameComponent first) {
    gameRef.camera.moveToTargetAnimated(
      first,
      zoom: 2,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            // Say(
            //   text: [
            //     TextSpan(
            //       text:
            //       ' Would you tell me, please ...  which way I ought to go from here? ',
            //     )
            //   ],
            //   person: Container(
            //     width: 100,
            //     height: 100,
            //     child: SpriteSheetHero.idleRight(),
            //   ),
            // ),
            Say(
              text: [
                TextSpan(
                  text: 'Welcome Adventurer you seem to be new here. This world is waiting for adventurers like you to explore this world.',
                ),
              ],
              person: Container(
                width: 100,
                height: 100,
                child: HatGuySpriteSheet.idle.asWidget(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
            // Say(
            //   text: [
            //     TextSpan(
            //       text: ' I don\'t much care where. ',
            //     ),
            //   ],
            //   person: Container(
            //     width: 100,
            //     height: 100,
            //     child: PlayerSpriteSheet.idleRight.asWidget(),
            //   ),
            // ),
            Say(
              text: [
                TextSpan(
                  text: "Let's start by connecting to the wallet",
                ),
              ],
              person: Container(
                width: 100,
                height: 100,
                child: HatGuySpriteSheet.idle.asWidget(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
          ],
          onClose: () {
            gameRef.camera.moveToPlayerAnimated(zoom: 1);
          },
          onFinish: () {},
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }

  @override
  void onTap() {
    execShowTalk(this);
  }

  @override
  void onTapCancel() {}

  @override
  void onTapDown(int pointer, Vector2 position) {}

  @override
  void onTapUp(int pointer, Vector2 position) {}
}
