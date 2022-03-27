import 'package:flutter/material.dart';

class CryptoVilleMap extends StatelessWidget {
  double x;
  double y;
  String currentMap;

  CryptoVilleMap({required this.x, required this.y, required this.currentMap});

  @override
  Widget build(BuildContext context) {
    if (currentMap == "cryptoville") {
      return Container(
        alignment: Alignment(x, y),
        child: Image.asset("../../assets/images/maps/new-map.png"),
        // width: MediaQuery.of(context).size.width * 0.75,
      );
    } else {
      return Container();
    }
  }
}