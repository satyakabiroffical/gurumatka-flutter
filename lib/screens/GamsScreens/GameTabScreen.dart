import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_1.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_2.dart';

class GameTabScreen extends StatelessWidget {
  const GameTabScreen({super.key});

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

                  GameTab1(),
                  GameTab2(),
                  Container(color: Colors.yellow,),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
