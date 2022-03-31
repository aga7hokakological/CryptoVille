import 'package:bonfire/bonfire.dart';
import 'package:bonfire/enemy/enemy.dart';
import 'package:bonfire/util/direction_animations/simple_direction_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multibiomegame/main.dart';
import 'package:multibiomegame/npc/sprite_sheet_npc.dart';
import 'package:multibiomegame/player/game_player.dart';

import '../player/sprite_sheet_hero.dart';
import '../util/custom_sprite_animation_widget.dart';


class Sensei extends SimpleEnemy with ObjectCollision, TapGesture {
  bool _showConversation = false;
  Sensei(Vector2 position)
    : super(
    animation: SenseiSpriteSheet.simpleDirectionAnimation,
    position: position,
    size: Vector2.all(tileSize * 1.6),
    // speed: tileSize * 1.6
  );

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null) {
      this.seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!_showConversation) {
            gameRef.player!.idle();
            _showConversation = true;
            // _showEmote(emote: 'emote/emote_interregacao.png');
            // _showIntroduction();
          }
        },
        radiusVision: (2 * tileSize),
      );
    }
  }

  @override
  void onTap() {
    // TODO: implement onTap
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(int pointer, Vector2 position) {
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(int pointer, Vector2 position) {
    // TODO: implement onTapUp
  }

  // void _showIntroduction() {
  //   // Sounds.interaction();
  //   TalkDialog.show(gameRef.context, [
  //     Say(
  //       text: [
  //         TextSpan(text: getString('talk_wizard_1')),
  //       ],
  //       person: CustomSpriteAnimationWidget(
  //         animation: SenseiSpriteSheet.senseiIdleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.RIGHT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_player_1'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: GamePlayer.idleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.LEFT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_wizard_2'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: SenseiSpriteSheet.senseiIdleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.RIGHT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_player_2'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: GamePlayer.idleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.LEFT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_wizard_3'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: SenseiSpriteSheet.idle(),
  //       ),
  //       personSayDirection: PersonSayDirection.RIGHT,
  //     ),
  //   ],
  //   );
  // }

    //     onChangeTalk: (index) {
    //   Sounds.interaction();
    // }, onFinish: () {
    //   Sounds.interaction();
    // });

}

class HatGuy extends SimpleEnemy with ObjectCollision, TapGesture {
  bool _showConversation = false;
  HatGuy(Vector2 position)
      : super(
    animation: SenseiSpriteSheet.simpleDirectionAnimation,
    position: position,
    size: Vector2.all(tileSize * 1.6),
    // speed: tileSize * 1.6
  );

  @override
  void update(double dt) {
    super.update(dt);
    if (gameRef.player != null) {
      this.seeComponent(
        gameRef.player!,
        observed: (player) {
          if (!_showConversation) {
            gameRef.player!.idle();
            _showConversation = true;
            // _showEmote(emote: 'emote/emote_interregacao.png');
            // _showIntroduction();
          }
        },
        radiusVision: (2 * tileSize),
      );
    }
  }

  @override
  void onTap() {
    // TODO: implement onTap
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(int pointer, Vector2 position) {
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(int pointer, Vector2 position) {
    // TODO: implement onTapUp
  }

  // void _showIntroduction() {
  //   // Sounds.interaction();
  //   TalkDialog.show(gameRef.context, [
  //     Say(
  //       text: [
  //         TextSpan(text: getString('talk_wizard_1')),
  //       ],
  //       person: CustomSpriteAnimationWidget(
  //         animation: SenseiSpriteSheet.senseiIdleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.RIGHT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_player_1'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: GamePlayer.idleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.LEFT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_wizard_2'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: SenseiSpriteSheet.senseiIdleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.RIGHT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_player_2'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: GamePlayer.idleRight(),
  //       ),
  //       personSayDirection: PersonSayDirection.LEFT,
  //     ),
  //     Say(
  //       text: [TextSpan(text: getString('talk_wizard_3'))],
  //       person: CustomSpriteAnimationWidget(
  //         animation: SenseiSpriteSheet.idle(),
  //       ),
  //       personSayDirection: PersonSayDirection.RIGHT,
  //     ),
  //   ],
  //   );


//     onChangeTalk: (index) {
//   Sounds.interaction();
// }, onFinish: () {
//   Sounds.interaction();
// });

}