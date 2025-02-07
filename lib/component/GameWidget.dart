import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/appIcons.dart';

import '../daimention/daimentio n.dart';
import '../fakeData.dart';


class GameWidget extends StatelessWidget {
  final String data;
  const GameWidget({this.data='',super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(3),
          height: SC.from_width(60),
          width: SC.from_width(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [
              Color.fromRGBO(254, 226, 128, 1),
              Color.fromRGBO(254, 209, 97, 1)
            ])
          ),
          child: Image.asset(AIcon.crown),
        ),
        SizedBox(height: SC.from_width(8),),
        Text(data,style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SC.from_width(12)
        ),),
      ],
    );
  }
}
