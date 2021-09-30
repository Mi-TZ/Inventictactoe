import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac/components/board.dart';
import 'package:tic_tac/components/btn.dart';
import 'package:tic_tac/pages/game.dart';
import 'package:tic_tac/pages/gameeasy.dart';
import 'package:tic_tac/services/board.dart';

class difficulty extends StatefulWidget {
  @override
  _difficultyState createState() => _difficultyState();
}

class _difficultyState extends State<difficulty> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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

            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(50),
                  child: Text('Select Difficulty',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,color: Colors.white),),
                ),
              ],

            ),

              SizedBox(height:  MediaQuery.of(context).size.height*0.02,),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Btn2(
                      onTap: () {
                        soundService.playSound('click');

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>GamePage(true)
                          ),
                        );
                      },
                      color: Colors.white,
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      child: Text(
                        "Invinctic Mode".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),

                    SizedBox(height:  MediaQuery.of(context).size.height*0.02,),
                    Btn(
                      onTap: () {
                        soundService.playSound('click');

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) =>GamePageeasy()
                          ),
                        );
                      },
                      color: Colors.white,
                      height: 40,
                      width: 250,
                      borderRadius: 250,
                      child: Text(
                        "Easy Mode".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
              ),


]
        ),
      ),
      ));
  }
}
