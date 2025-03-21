import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/models/all%20game%20responce.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/GamsScreens/gameDetailScree.dart';

import '../daimention/daimentio n.dart';
import '../fakeData.dart';


class GameWidget extends StatelessWidget {
  final Game? data;
  const GameWidget({this.data,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        children: [
          ClipRRect(

            borderRadius: BorderRadius.circular(SC.from_width(60)),
            child: Ink(
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
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: (){
                  RouteTo(context, child: (p0, p1) => GameDetail(game: data,),);
                },
                  child: Image.asset(AIcon.crown)),
            ),
          ),
          SizedBox(height: SC.from_width(8),),
          Text('${data?.name??'Game'}',style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: SC.from_width(12)
          ),),
        ],
      ),
    );
  }
}
