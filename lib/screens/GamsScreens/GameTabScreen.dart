import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_1.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_2.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_3.dart';

class GameTabScreen extends StatelessWidget {
  final Game? game;
  const GameTabScreen({required this.game,super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: BackGround(
        child: Scaffold(

          //
          appBar: AppBar(
            title: Text("Gams"),
          ),

          //
          body: Column(
            children: [

              //
              TabBar(
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  //
                  Tab(text: 'Jodi',),
                  //
                  Tab(text: 'Crossing',),
                  //
                  Tab(text: 'Haruf',),
                ],
              ),
              Expanded(
                child: TabBarView(children: [

                  GameTab1(game: game,),
                  GameTab2(game: game,),
                  GameTab3(game: game),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
