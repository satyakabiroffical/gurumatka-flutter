import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/WinnerAvtar.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/winner_list_tile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class WinnerWidget extends StatelessWidget {
  const WinnerWidget({super.key});

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
                    WinnerAvatar(
                      color: Colors.white,
                      size: 76,
                      num: 2,
                      child: Image.asset(AIcon.sampleProfile,fit: BoxFit.cover,),
                    ),
                    SizedBox(height: SC.from_width(20),),


                    Text("Vatani",style:TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(21)
                    ),),


                    Text("Level 3",style:TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(19)
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
                    child: Image.asset(AIcon.sampleProfile,fit: BoxFit.cover,),
                    ),
                    SizedBox(height: SC.from_width(20),),


                    Text("Iman",style:TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(21)
                    ),),


                    Text("Level 32",style:TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(19)
                    ),),
                  ],
                ),
              ),

              //third
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    //Second Winner
                    WinnerAvatar(
                      color: Color.fromRGBO(255, 130, 40, 1),
                      size: 76,
                      num: 3,
                      child: Image.asset(AIcon.sampleProfile,fit: BoxFit.cover,),
                    ),
                    SizedBox(height: SC.from_width(20),),


                    Text("Vatani",style:TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(21)
                    ),),


                    Text("Level 3",style:TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(19)
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
            index: 1),
        SizedBox(height: SC.from_width(13),),


        //
        WinnerListTile(
          forGroundColor: Colors.black,
          color: Colors.white,
            index: 2),
        SizedBox(height: SC.from_width(13),),

        //
        WinnerListTile(
          forGroundColor: Colors.black,
          color: Color.fromRGBO(255, 130, 40, 1),
            index: 3),
        SizedBox(height: SC.from_width(13),),
      ],
    );
  }
}
