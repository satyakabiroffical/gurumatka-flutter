import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class WinnerListTile extends StatelessWidget {
  final int index;
  final Color? color;
  final Color? forGroundColor;
  const WinnerListTile({this.forGroundColor,this.color,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100)
      ),
      margin: EdgeInsets.symmetric(horizontal: 10),
      padding:EdgeInsets.symmetric(horizontal: 20),
      height: SC.from_width(58),
      child: Row(children: [

        Icon(Icons.arrow_back_ios,color: forGroundColor,),

        Container(
          margin: EdgeInsets.only(right: SC.from_width(5)),
          clipBehavior: Clip.hardEdge,
          height: SC.from_width(35),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(AIcon.sampleProfile,
            fit: BoxFit.cover,),
        ),


        Text('$index',
        style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: SC.from_width(19),
          color: forGroundColor
        ),),
        SizedBox(width: 12,),

        Text("Jonathan ",
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(19),
            color: forGroundColor,

          ),),
        Spacer(),

        RichText(
          text: TextSpan(
              text: '1241',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SC.from_width(18),
                color: Colors.grey
              ),
              children: [
                TextSpan(text: '.pts',style: TextStyle(fontSize: SC.from_width(12)))
              ]
          ),
        ),

      ],),
    );
  }
}
