import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/drawer%20tile.dart';
import 'package:guru_matka_new/component/provfileAvtar.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

import '../../../component/AppConstent.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          children: [
            
            //
            //Profile Section
            Container(
              //
              width: double.infinity,
              //
              decoration: BoxDecoration(
                color:  Colors.black,
                borderRadius:BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                )
              ),
              //
              height: SC.from_width(296),
              //
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  //
                  //Profile Image
                  ProfieleAvtar(
                    redias: SC.from_width(52),
                    child: Image.asset(AIcon.sampleProfile,
                      fit: BoxFit.cover,),
                  ),
                  
                  
                  //Name Text 
                  Text("Raghav Singh",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: SC.from_width(20),
                    fontWeight: FontWeight.w700
                  ),),
                  
                  //Email Text
                  Text("Raghav0004@gmail.com",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: SC.from_width(14),
                          fontWeight: FontWeight.w400
                      )),
                  SizedBox(height: SC.from_width(23),),
                  
                  
                  //Profile Progress Text
                  Text('60% profile completed',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: SC.from_width(14),
                      fontWeight: FontWeight.w400
                  ),),
                  
                  //Value slider
                  SizedBox(
                    height: SC.from_width(20),
                    child: SliderTheme(
                      data: SliderThemeData(
                          thumbColor: Colors.transparent,
                          trackHeight: 10,
                          activeTrackColor: AppConstant.themYellow,
                          thumbShape: RoundSliderThumbShape(
                            elevation: 0,
                            pressedElevation: 0,
                            enabledThumbRadius: 0,
                            disabledThumbRadius: 0,
                          )),
                      child: Slider(
                          value: 60,
                          min: 0,
                          max: 100,
                          thumbColor: Colors.transparent,
                          onChanged: (d) {}),
                    ),
                  )
                ],
              ),
            ),
            
            //
            DrawerTile(
              icon:Image.asset(AIcon.how_to_play,height: SC.from_width(24),),
                label: "How to Play"),

            //
            DrawerTile(
                icon:Image.asset(AIcon.star,height: SC.from_width(24),),
                label: "Compaby trust profile"),

            //
            DrawerTile(
                icon:Image.asset(AIcon.transictionHistory,height: SC.from_width(24),),
                label: "Transaction History"),

            //
            DrawerTile(
                icon:Image.asset(AIcon.leadBoard,height: SC.from_width(24),),
                label: "Leaderboard"),

            //
            DrawerTile(
                icon:Image.asset(AIcon.web,height: SC.from_width(24),),
                label: "website"),

            //
            DrawerTile(
                icon:Image.asset(AIcon.signOut,height: SC.from_width(24),),
                label: "Sign out"),

          ],
        ),
      ),
    );
  }
}
