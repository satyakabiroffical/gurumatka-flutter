import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/GameWidget.dart';
import 'package:guru_matka_new/component/LiveGamesTile.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/fakeData.dart';



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

            //Games List
            SizedBox(
              width: SC.Screen_width,
              height: SC.from_width(90),
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: SampleData.gams.length,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: SC.from_width(12),),
                itemBuilder: (context, index) {
                  return  GameWidget(data: SampleData.gams[index]);
                },
              ),
            ),

            //
            Padding(
              padding : EdgeInsets.all(20),
              child: Text("Live Games",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(16)
              ),),
            ),


            for(int i=0;i<6;i++)
              Padding(
                padding:  EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: SC.from_width(18)
                ),
                child: LiveGameTile(),
              )


            
          ],
        ),
        
      ),
    );
  }
}
