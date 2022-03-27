import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  final int playerSpriteCount;
  final String direction;
  final String location;
  double height = 25;

  Player({required this.playerSpriteCount, required this.direction, required this.location});

  @override
  Widget build(BuildContext context) {
    if (location == "cryptoville") {
      height = 25;
    }

    return Container(
      height: height,
      child: Image.asset(
        "../../assets/images/characters/hero/hero_" + direction + playerSpriteCount.toString() + ".png",
        fit: BoxFit.cover,
      ),
    );
  }
}