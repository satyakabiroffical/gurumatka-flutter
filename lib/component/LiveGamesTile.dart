import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/GamsScreens/GameTabScreen.dart';

class LiveGameTile extends StatelessWidget {
  final Game? game;
  final bool? noData;
  const LiveGameTile({this.noData,this.game,super.key});

  @override
  Widget build(BuildContext context) {
    
    
    return GestureDetector(
      //
      onLongPress: (){
        if(kDebugMode)
          {
            OpenDailovgWithAnimation(context, dailog: AlertDialog(
              content: Text('${game?.toJson().toString()}'),
            ));
          }
      },

      //
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
            top: SC.from_width(13),
            bottom: SC.from_width(12),
            right: SC.from_width(16)
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: AppConstant.themYellow
            )
        ),

        child:(noData==true)?
           Center(child: Text("No Game Is Live")) :
        Row(
          children: [
            Container(
              height: SC.from_width(67),
              width: SC.from_width(5),
              decoration: BoxDecoration(
                  color: AppConstant.themYellow,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight : Radius.circular(6),
                  )
              ),
            ),

            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: SC.from_width(59),
              width: SC.from_width(59),
              margin: EdgeInsets.only(
                right: SC.from_width(5),
                left: SC.from_width(7),
              ),
              decoration: BoxDecoration(
                color: AppConstant.themYellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AIcon.crown),
            ),


            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  //Game Name
                  Text("${game?.name??"Game"}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SC.from_width(16),
                    ),),

                  //
               

                  //Sub Title Text
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: SC.from_width(5)
                    ),



                    child:  Row(
                      children: [
                        
                        SizedBox(
                          height: SC.from_width(27),
                          child: OutlinedButton(
                            style: ButtonStyle(
                          
                              padding: WidgetStatePropertyAll(EdgeInsets.all(0)),

                              side: WidgetStatePropertyAll(BorderSide(color: Colors.green)),


                              
                              
                              foregroundColor: WidgetStateColor.resolveWith((states) => Colors.green,)
                              
                            ),
                              onPressed:null, child: Text('${game?.gameOpenTime??0}')),
                        ),

                        //
                        SizedBox(width: SC.from_width(10),),

                        //
                        SizedBox(
                          height: SC.from_width(27),
                          child: OutlinedButton(
                              style: ButtonStyle(

                                  padding: WidgetStatePropertyAll(EdgeInsets.all(0)),

                                  side: WidgetStatePropertyAll(BorderSide(color: Colors.red)),




                                  foregroundColor: WidgetStateColor.resolveWith((states) => Colors.red,)

                              ),
                              onPressed:null, child: Text('${game?.gameClosingTime??0}')),
                        ),

                        //
                        SizedBox(width: SC.from_width(10),),

                        //
                        Container(
                          alignment: Alignment.center,
                          height: SC.from_width(27),
                          width: SC.from_width(27),
                          decoration: BoxDecoration(
                              color: Colors.red,
                            shape: BoxShape.circle
                          ),
                          child: Text("${game?.recentResult}",style: TextStyle(fontWeight: FontWeight.w700),),
                        ),






                        
                      ],
                    ),
                  )



                ],),
            ),



            //Play Button
            Container(
              // color: kDebugMode?Colors.red:null,

              child: Column(
                children: [
                  Card(
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Ink(

                      height: SC.from_width(45),
                      width: SC.from_width(45),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(

                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,

                            colors:[

                              //
                              Color.fromRGBO(1 , 1 , 0, 1),
                              Color.fromRGBO(0, 0, 0, 1),
                              Color.fromRGBO(27, 22, 14, 1),


                            ]),
                      ),

                      child:

                          //
                      InkWell(
                          onTap: (){
                            RouteTo(context, child: (p0, p1) => GameTabScreen(game: game,),);
                          },
                          child: Center(child: Icon(Icons.play_arrow_rounded,size: SC.from_width(30),))),

                      //
                    ),
                  ),

                  Text("Play",style: TextStyle(fontWeight: FontWeight.w400),)
                ],
              ),
            )

            //

          ],
        ),
      ),
    );
  }
}
