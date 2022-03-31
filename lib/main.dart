import 'dart:async';

import 'package:cryptoville/player/npc_girl.dart';
import 'package:cryptoville/player/player.dart';
import 'package:flutter/material.dart';
import 'package:cryptoville/maps/map.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cryptoville/metamask_provider.dart';

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
      mapY += 0.1;
    });
  }
  void moveDown() {
    playerDirection = "down";
    setState(() {
      mapY -= 0.1;
    });
  }
  void moveLeft() {
    playerDirection = "left";
    setState(() {
      mapX += 0.1;
    });
  }
  void moveRight() {
    playerDirection = "right";
    setState(() {
      mapX -= 0.1;
    });
  }

  void animateWalk() {
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        playerSpriteCount++;
      });

      if (playerSpriteCount == 3) {
        playerSpriteCount = 0;
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Expanded(
            child: RawKeyboardListener(
              autofocus: true,
              focusNode: FocusNode(),
              onKey: (event) {
                if (event.isKeyPressed(LogicalKeyboardKey.keyA) ||
                    event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
                  moveLeft();
                } else if (event.isKeyPressed(LogicalKeyboardKey.keyD) ||
                    event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
                  moveRight();
                } else if (event.isKeyPressed(LogicalKeyboardKey.keyW) ||
                    event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
                  moveUp();
                } else if (event.isKeyPressed(LogicalKeyboardKey.keyS) ||
                    event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
                  moveDown();
                }
              },
              child: Scaffold(
                  body: Container(
                    color: Colors.black,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(100),
                          width: 1000,
                          height: 1000,
                          child: CryptoVilleMap(
                            x: mapX,
                            y: mapY,
                            currentMap: currentMapName,
                          ),
                        ),
                        Container(
                          alignment: Alignment(-0.2, 0),
                          child: Player(
                            location: currentMapName,
                            playerSpriteCount: playerSpriteCount,
                            direction: playerDirection,
                          ),
                        ),
                        // Container(
                        //   alignment: Alignment(-0.3, 0),
                        //   child: GirlNPC(
                        //     x: -0.03,
                        //     y: 0,
                        //     location: currentMapName,
                        //     girlDirection: girlDirection,
                        //   ),
                        // )
                      ],
                    ),
                  )
              ),
            ),
          ),
          Expanded(
            child: ChangeNotifierProvider(
              create: (context) => MetamaskProvider()..start(),
              builder: (context, child) {
                return Container(
                  alignment: Alignment(0.0, -1.0),
                  child: Consumer<MetamaskProvider>(
                    builder: (context, provider, child) {
                      late final String message;
                      if (provider.isConnected && provider.isInOperatingChain) {
                        message = 'Connected';
                      } else if (provider.isConnected &&
                          !provider.isInOperatingChain) {
                        message =
                        'Wrong chain. Please connect to ${MetamaskProvider.operatingChain}';
                      } else if (provider.isEnabled) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            MaterialButton(
                              onPressed: () =>
                                  context.read<MetamaskProvider>().connect(),
                              color: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    'https://i0.wp.com/kindalame.com/wp-content/uploads/2021/05/metamask-fox-wordmark-horizontal.png?fit=1549%2C480&ssl=1',
                                    width: 50,
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      } else {
                        message = "Please use web3 supported browser";
                      }

                      return Text(
                        message,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Container(
            child: Stack(
              children: [
                Positioned(
                  left: MediaQuery.of(context).size.width/2+150,
                  top: MediaQuery.of(context).size.height/2,
                  child: ElevatedButton(
                      onPressed: () {
                        print("Market");
                      },
                      child: Text("Market")),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width/2+100,
                  top: MediaQuery.of(context).size.height/1.5,
                  child: ElevatedButton(
                      onPressed: () {
                        print("Pool");
                      },
                      child: Text("Pool")),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width/2+50,
                  top: MediaQuery.of(context).size.height/3,
                  child: ElevatedButton(
                      onPressed: () {
                        print("Farm");
                      },
                      child: Text("Farm")),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width/2+100,
                  bottom: MediaQuery.of(context).size.height/1.7,
                  child: ElevatedButton(
                      onPressed: () {
                        print("Bank");
                      },
                      child: Text("Bank")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}