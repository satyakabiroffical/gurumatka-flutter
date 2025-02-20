import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/leaderBoardProvider.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/component/tab_tile.dart';
import 'package:guru_matka_new/component/winner_list_tile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/screens/drawerscreens/leaderBoard/winnerWidget.dart';
import 'package:provider/provider.dart';


class LeaderBoard extends StatefulWidget {
  const LeaderBoard({super.key});

  @override
  State<LeaderBoard> createState() => _LeaderBoardState();
}

class _LeaderBoardState extends State<LeaderBoard> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<LeaderBoardProvider>(context,listen: false).getLeaderBordList(context);
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(

        //
        floatingActionButton: kDebugMode?FloatingActionButton(onPressed: (){
          Provider.of<LeaderBoardProvider>(context,listen: false).getLeaderBordList(context);
        }):null,

        //
        appBar: AppBar(
          title:Text("Leaderboard"),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.share_outlined))
          ],
        ),


        body: Consumer<LeaderBoardProvider>(
          builder: (context, p, child) {

            if(p.initInt)
              {
                return Center(child: CircularProgressIndicator(),);
              }


            // return Text("${p.winnersLit.length}");

            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                SizedBox(height: SC.from_width(25),),

                //
                Row(

                  children: [

                    for(var i in p.filter)
                      Expanded(child:TabTile(
                        onTap: ()=>p.filterLister(context, i),
                          active: i==p.curruntFilter,
                          label: '${i[0].toUpperCase()}${i.substring(1)}')),


                    //
                    // Expanded(child:TabTile(
                    //     active: true,
                    //     label: "Today")),
                    //
                    // //
                    // Expanded(child:TabTile(
                    //     active: false,
                    //     label: "Week")),
                    //
                    // //
                    // Expanded(child:TabTile(
                    //     active: false,
                    //     label: "Month")),
                  ],
                ),

                //
                if(p.loading==false&&p.winnersLit.length>0)
                WinnerWidget(
                  winners1: p.winnersLit[0],
                  winners2: p.winnersLit.length>1?p.winnersLit[1]:null,
                  winners3: p.winnersLit.length>2?p.winnersLit[2]:null,
                ),

                if(kDebugMode)
                  Text("${p.winnersLit.length}"),

                (p.loading)?Center(child: CircularProgressIndicator(),):ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(bottom: 20),
                  separatorBuilder: (context, index) => SizedBox(
                    height: SC.from_width(13),
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: (p.winnersLit.length>3)?p.winnersLit.length-3:0,
                  itemBuilder: (context, index) => WinnerListTile(
                    color: Colors.grey.shade900,
                    index: index+4,
                    winners:p.winnersLit[index+3],
                  ),
                )


              ],
            );
          },
        ),
      ),
    );
  }
}
