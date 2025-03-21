import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/Controllers/chat_provider.dart';
import 'package:guru_matka_new/apiService/game_api.dart';
import 'package:guru_matka_new/component/GameWidget.dart';
import 'package:guru_matka_new/component/LiveGamesTile.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/fakeData.dart';
import 'package:guru_matka_new/models/all%20game%20responce.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:provider/provider.dart';



class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        
        //
        appBar: AppBar(
          title: Text('Matka Game'),
        ),
        
        body: ListView(
          children: [
            SizedBox(height: SC.from_width(20),),



            //
            FutureBuilder(future:GamesAPi().getAllGames(), builder: (context, snapshot) {


              //
              if(snapshot.connectionState==ConnectionState.waiting)
              {
                return Center(child: CircularProgressIndicator(),);
              }

              //
              if(snapshot.hasError)
                // if(true)
                  {
                return Center(child: HtmlWidget("Error:\n${snapshot.error}"),);
              }


              // return Text("${snapshot.data!.statusCode}\n${snapshot.data?.body}");

              //
              if(snapshot.data?.statusCode==200)
              {
                AllGameResponce gameData = AllGameResponce.fromJson(jsonDecode(snapshot.data?.body??''));

                if(gameData.data!=null&& gameData.data!.length>0)
                {
                  return  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                      child: Row(
                        children: [
                          for(var n in gameData.data!)
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: GameWidget(data: n),
                            )
                        ],
                      ),
                    ),
                  );
                }

                else
                {
                  return Center(child: Text("No Notification"),);
                }



              }


              return Center(child: HtmlWidget("Un Expected Error :\n${snapshot.error}"),);

              },),

            //Games List
            // SizedBox(
            //   width: SC.Screen_width,
            //   height: SC.from_width(90),
            //   child: ListView.separated(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     itemCount: SampleData.gams.length,
            //     primary: false,
            //     shrinkWrap: true,
            //     scrollDirection: Axis.horizontal,
            //     separatorBuilder: (context, index) => SizedBox(width: SC.from_width(12),),
            //     itemBuilder: (context, index) {
            //       // return  GameWidget(data: SampleData.gams[index]);
            //       return  SizedBox();
            //     },
            //   ),
            // ),

            //
            Padding(
              padding : EdgeInsets.all(20),
              child: Text("Live Games",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(16)
              ),),
            ),


            Consumer<SocketProvider>(builder: (context, p, child) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: (p.openGames.length>0)?List.generate(p.openGames.length, (index) =>
                  Padding(
                    padding:EdgeInsets.symmetric(vertical: 5),
                    child: LiveGameTile(game: p.openGames[index],),
                  ),):[LiveGameTile(noData: true,)]),
            ),
            )



            
          ],
        ),
        
      ),
    );
  }
}
