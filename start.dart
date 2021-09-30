import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/components/btn.dart';
import 'package:tic_tac/difficulty.dart';
import 'package:tic_tac/pages/game.dart';
import 'package:tic_tac/pages/pick.dart';
import 'package:tic_tac/pages/settings.dart';
import 'package:tic_tac/services/alert.dart';
import 'package:tic_tac/services/board.dart';
import 'package:tic_tac/services/provider.dart';
import 'package:tic_tac/services/sound.dart';
import 'package:tic_tac/theme/theme.dart';

import 'gameeasy.dart';

class StartPage extends StatelessWidget {
  final boardService = locator<BoardService>();
  final soundService = locator<SoundService>();
  final alertService = locator<AlertService>();

  StartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Future.value(false);
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.65],
                colors: [

                  Color(0xFF647dee),
                  Color(0xFF412AA5),
                ],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[

                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Image(
                            image: AssetImage('assets/logo.png',),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Btn(
                        onTap: () {
                          boardService.gameMode$.add(GameMode.Solo);
                          soundService.playSound('click');

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => difficulty()
                            ),
                          );
                        },
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        color: Colors.white,
                        child: Text(
                          "single player".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 30),
                      Btn1(
                        onTap: () {
                          boardService.gameMode$.add(GameMode.Multi);
                          soundService.playSound('click');

                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => GamePage(false),
                            ),
                          );
                        },
                        color: Colors.white,
                        height: 40,
                        width: 250,
                        borderRadius: 250,
                        child: Text(
                          "with a friend".toUpperCase(),
                          style: TextStyle(
                              color: Colors.white.withOpacity(.8),
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 30),

                      SizedBox(height: 30),
                      Btn(
                        onTap: () {
                          soundService.playSound('click');
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => SettingsPage(),
                            ),
                          );
                        },
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        borderRadius: 25,
                        child: Icon(Icons.settings,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
