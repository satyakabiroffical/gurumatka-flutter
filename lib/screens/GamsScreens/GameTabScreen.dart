import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/game%20provider.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_1.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_2.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameTab/game_tab_3.dart';
import 'package:provider/provider.dart';

class GameTabScreen extends StatefulWidget {
  final Game? game;
  const GameTabScreen({required this.game,super.key});

  @override
  State<GameTabScreen> createState() => _GameTabScreenState();
}

class _GameTabScreenState extends State<GameTabScreen> {
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<GameProvider>(context,listen: false).getUserBettingAmount(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: ()async{
        Provider.of<GameProvider>(context,listen: false).clear();
        return true;
      },

      child: DefaultTabController(
        length: 3,
        child: BackGround(
          child: Scaffold(

            //
            appBar: AppBar(
              title: Text("Games"),
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

                    GameTab1(game: widget.game,),
                    GameTab2(game: widget.game,),
                    GameTab3(game: widget.game),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
