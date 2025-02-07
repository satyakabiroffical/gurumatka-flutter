import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/CustomFeild.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class GameTab2 extends StatelessWidget {
  const GameTab2({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20
      ),
      children: [


        //
        Container(
          padding: EdgeInsets.symmetric(horizontal: SC.from_width(17)),
          height: SC.from_width(260),
          
          //
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8),
          ),
    
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      
      CustomFeild(label: "Crossing Number"),
      
      CustomFeild(label: "Crossing into Amount"),

      ListTile(
        contentPadding: EdgeInsets.zero,
        //
        title: Text("*Crossing Amount Below 5000"),

        //
        subtitle: Row(children: [
          Checkbox(value: false, onChanged: (d){}),
          Text("Joda Cut")

        ],),
      )
      
    ],
    ),


        ),
        SizedBox(height: SC.from_width(27),),
        
        //
        CustomButton(title: 'Save'),
        SizedBox(height: SC.from_width(27),),

        //
        Text("Total number of crossing",style:TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: SC.from_width(16),

        ),),
        SizedBox(height: SC.from_width(18),),


        //
        Container(
          height: SC.from_width(74),
          decoration: AppConstant.greyBoxDecoration,
          child: Row(
            children: [


            ],
          ),
        ),
        SizedBox(height: SC.from_width(31),),


        //
        Container(
          // height: SC.from_width(58),
          decoration: AppConstant.greyBoxDecoration,

          //
          child: ListTile(

            //
            title: Text('Total Amount'),
            //
            subtitle: Text("0"),

            //
            trailing: SizedBox(
              height: SC.from_width(34),
                width: SC.from_width(88),child: CustomButton(title: "Submit")),

            //
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(14)
            ),

            //
            subtitleTextStyle: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: SC.from_width(18)
            ),

          ),
        )
      
      
      ],
    );
  }
}
