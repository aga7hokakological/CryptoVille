import 'package:cryptoville/player/npc_girl.dart';
import 'package:cryptoville/player/player.dart';
import 'package:flutter/material.dart';
import 'package:cryptoville/maps/map.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double mapX = 0;
  double mapY = 0;
  String currentMapName = "cryptoville";

  String girlDirection = "down";
  static double girlX = 0.5;
  static double girlY = 0.5;
  bool chatStarted = false;
  int countPressingSpace = -1;

  int playerSpriteCount = 0;
  String playerDirection = "down";

  void moveUp() {
    playerDirection = "up";
    setState(() {
      mapY += 0.2;
    });
  }
  void moveDown() {
    playerDirection = "down";
    setState(() {
      mapY -= 0.2;
    });
  }
  void moveLeft() {
    playerDirection = "left";
    setState(() {
      mapX += 0.2;
    });
  }
  void moveRight() {
    playerDirection = "right";
    setState(() {
      mapX -= 0.2;
    });
  }

  // void animateWalk() {
  //   Timer timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
  //     setState(() {
  //       playerSpriteCount++;
  //     });
  //
  //     if (playerSpriteCount == 3) {
  //       playerSpriteCount = 0;
  //       timer.cancel();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
        onKey: (event) {
          if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
            moveUp();
          }
          if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
            moveDown();
          }
          if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
            moveLeft();
          }
          if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
            moveRight();
          }
        },
        child: Scaffold(
            body: Container(
              color: Colors.black,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(100),
                    width: 800,
                    height: 800,
                    child: CryptoVilleMap(
                      x: mapX,
                      y: mapY,
                      currentMap: currentMapName,
                    ),
                  ),
                  Container(
                    alignment: Alignment(-0.3, 0),
                    child: Player(
                      location: currentMapName,
                      playerSpriteCount: playerSpriteCount,
                      direction: playerDirection,
                    ),
                  ),
                  Container(
                    alignment: Alignment(-0.3, 0),
                    child: GirlNPC(
                      x: -0.03,
                      y: 0,
                      location: currentMapName,
                      girlDirection: girlDirection,
                    ),
                  )
                ],
              ),
            )
        ),
    );
  }
}
