import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/component/tab_tile.dart';
import 'package:guru_matka_new/component/winner_list_tile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/screens/drawerscreens/leaderBoard/winnerWidget.dart';


class LeaderBoard extends StatelessWidget {
  const LeaderBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        
        //
        appBar: AppBar(
          title:Text("Leaderboard"),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined))
          ],
        ),
        
        
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          children: [
            SizedBox(height: SC.from_width(25),),

            //
            Row(

              children: [

                //
                Expanded(child:TabTile(
                  active: true,
                    label: "Today")),

                //
                Expanded(child:TabTile(
                  active: false,
                    label: "Week")),

                //
                Expanded(child:TabTile(
                  active: false,
                    label: "Month")),
              ],
            ),

            //
            WinnerWidget(),


            ListView.separated(
              primary: false,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 20),
              separatorBuilder: (context, index) => SizedBox(
                height: SC.from_width(13),
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) => WinnerListTile(
                index: index+4,
              ),
            )

            
          ],
        ),
      ),
    );
  }
}
