import 'package:flutter/material.dart';
import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/WinnerAvtar.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/winner_list_tile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/leader_board_api_responce.dart';


class WinnerWidget extends StatelessWidget {
  final Winners? winners1;
  final Winners? winners2;
  final Winners? winners3;
  const WinnerWidget({this.winners1,this.winners2,this.winners3,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          height: SC.from_width(258),
          child: Row(
            children: [


              //second
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    //Second Winner
                    if(winners2!=null)
                      WinnerAvatar(
                        color: Colors.white,
                        size: 76,
                        num: 2,
                        child: Image.network('${MyUrl.bucketUrl}${winners2?.userId?.image}',fit: BoxFit.cover,),
                      ),
                    SizedBox(height: SC.from_width(20),),


                    Text("${winners2?.userId?.userName}",
                      textAlign: TextAlign.center,


                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,

                      style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(21)
                    ),),



                    SizedBox(height: SC.from_width(20),)
                  ],
                ),
              ),



              //first
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    //Second Winner
                    WinnerAvatar(
                    color: AppConstant.themYellow,
                    size: 115,
                    isWinner: true,
                    num: 1,
                    child: Image.network('${MyUrl.bucketUrl}${winners1?.userId?.image}',fit: BoxFit.cover,),
                    ),
                    SizedBox(height: SC.from_width(20),),


                    Text("${winners1?.userId?.userName}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,

                      style:TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(21),
                    ),),

                  ],
                ),
              ),

              //third
              if(winners3!=null)
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      //Second Winner
                      WinnerAvatar(
                        color: Color.fromRGBO(255, 130, 40, 1),
                        size: 76,
                        num: 3,
                        child: Image.network('${MyUrl.bucketUrl}${winners3?.userId?.image}',fit: BoxFit.cover,),
                      ),
                      SizedBox(height: SC.from_width(20),),


                      Text('${winners3?.userId?.userName}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style:TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SC.from_width(21)
                      ),),


                      SizedBox(height: SC.from_width(20),),
                    ],
                  ),
                )

            ],
          ),
        ),
        SizedBox(height: SC.from_width(31),),


        //
        WinnerListTile(
          forGroundColor: Colors.black,
          color: AppConstant.themYellow,
            winners: winners1,
            index: 1),
        SizedBox(height: SC.from_width(13),),


        //

       if(winners2!=null)
         WinnerListTile(
             winners: winners2,
             forGroundColor: Colors.black,
             color: Colors.white,
             index: 2),
        SizedBox(height: SC.from_width(13),),

        //
        if(winners3!=null)
          WinnerListTile(
              winners: winners3,
              forGroundColor: Colors.black,
              color: Color.fromRGBO(255, 130, 40, 1),
              index: 3),
        SizedBox(height: SC.from_width(13),),
      ],
    );
  }
}
