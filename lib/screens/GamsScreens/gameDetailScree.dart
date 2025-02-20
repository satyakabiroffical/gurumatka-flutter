import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/apiService/game_api.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/customFormater.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/gameDetail.dart';
import 'package:guru_matka_new/models/gameModel.dart';

//
class GameDetail extends StatelessWidget {
  final Game? game;
  const GameDetail({this.game,super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
      
        //
        appBar: AppBar(
      
          //
          title: Text("Company Detail"),
      
        ),
      
        //
        body:Center(
          child: Container(

            clipBehavior: Clip.hardEdge, 
            margin:EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: SC.from_width(200),
              top: SC.from_width(47),
      
            ),
      
            decoration: AppConstant.greyBoxDecoration,
            child: FutureBuilder(future: GamesAPi().getGameById(game?.id??''), builder: (context, snapshot) {
      
      
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
      
      
      
      
              switch(snapshot.data?.statusCode)
              {
                case 200:
      
                  var _detaile = GameDtaile.fromJson(jsonDecode(snapshot.data?.body??'')['data']);
      
                  return  Column(

                    children: [
                      

                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        color: Colors.black,
                        padding: EdgeInsets.all(10),
                        child: Text("${game?.name??'Game'}"),
                      ),
                      SizedBox(height: SC.from_width(21),),
      
                      // if(kDebugMode)
                      //   Text("${snapshot.data?.body}"),
      
                      CircleAvatar(
                        radius: SC.from_width(45),
                        child: Image.asset(AIcon.crown),
                      ),
                      SizedBox(height: SC.from_width(20),),
      
      
                      //
      
      
      
                      //
                      Padding(
                        padding:EdgeInsets.all(20),
                        child: HtmlWidget('${_detaile.description??''}'),
                      ),
                      SizedBox(height: SC.from_width(30),),
      
      
                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        decoration: BoxDecoration(
      
                          borderRadius: BorderRadius.circular(4),
                          border:Border.all(
                            color: Colors.white
                          )
                        ),
      
                        child: Column(
                          children: [
      
                            //
                            Row(
                              children: [
                                Text("Game Open Time: "),
                                //
                                Spacer(),
                                Text('${_detaile.gameOpenTime}'),
                              ],
                            ),
      
                            SizedBox(height: SC.from_width(7),),
      
                            //
                            Row(
                              children: [
                                Text("Game Close Time :"),
                                //
                                Spacer(),
                                Text('${_detaile.gameClosingTime}'),
                              ],
                            ),
                          ],
                        ),
                      )
      
                    ],
                  );
      
                case 400:
                  return Center(child: Text("${snapshot.data?.body}"));
      
                default:
                  return Center(child: Text("No Notification"),);
              }
      
      
      
      
      
            },),
          ),
        ),
      ),
    );
  }
}
