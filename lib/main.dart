import 'dart:math';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multibiomegame/maps/map2.dart';
import 'package:multibiomegame/player/sprite_sheet_hero.dart';
import 'package:multibiomegame/npc/sprite_sheet_sensei.dart';

double tileSize = 16.0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpriteSheetHero.load();
  if (!kIsWeb) {
    await Flame.device.setLandscape();
    await Flame.device.fullScreen(); 
  }
  runApp(MyApp());
}

enum ShowInEnum {
  left,
  right,
  top,
  bottom,
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoVille',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LayoutBuilder(builder: (context, constraints) {
        tileSize = max(constraints.maxHeight, constraints.maxWidth) / 30;
        print(tileSize);
        return Map2();
      }),
    );
  }
}
