import 'package:flutter/material.dart';

class GirlNPC extends StatelessWidget {
  double x;
  double y;
  String location;
  String girlDirection;

  GirlNPC({
    required this.x, required this.y, required this.location, required this.girlDirection
  });

  @override
  Widget build(BuildContext context) {
    if (location == "cryptoville") {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset(
          "../../assets/images/characters/blue_girl.png",
          // width: MediaQuery.of(context).size.width * 0.75,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Container();
    }
  }
}