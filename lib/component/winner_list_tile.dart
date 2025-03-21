import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/leader_board_api_responce.dart';

import '../apiService/api_path.dart';


class WinnerListTile extends StatelessWidget {
  final int index;
  final Color? color;
  final Winners? winners;
  final Color? forGroundColor;
  const WinnerListTile({this.winners,this.forGroundColor,this.color,required this.index,super.key});

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

        // Icon(Icons.arrow_back_ios,color: forGroundColor,),

        Text('$index',
          style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(19),
              color: forGroundColor
          ),),
        SizedBox(width: 12,),

        AspectRatio(
          aspectRatio: 1,
          child: Container(

            margin: EdgeInsets.only(right: SC.from_width(5)
            ,
              top: SC.from_width(8),
              bottom: SC.from_width(8),
            ),
            clipBehavior: Clip.hardEdge,
            height: SC.from_width(35),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child:  Image.network('${MyUrl.bucketUrl}${winners?.userId?.image}',fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Icon(Icons.person,color: forGroundColor,),),
          ),
        ),





        Expanded(
          child: Text("${winners?.userId?.userName??"unknown"}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SC.from_width(19),
              color: forGroundColor,
          
            ),),
        ),
        Spacer(),

        RichText(
          text: TextSpan(
              text: '${winners?.points??0}',
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
