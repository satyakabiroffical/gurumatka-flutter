import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/DipositHistoryTile.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/withdrawHistoryTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';




class DipositHistoryScreen extends StatelessWidget {
  const DipositHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text("Deposit History"),
        ),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          children: [

            for(int i = 0;i<10;i++)
              Padding(
                padding: EdgeInsets.only(bottom: SC.from_width(22)),
                child: DipositHistoryTile(

                ),
              )

          ],
        ),
        
      ),
    );
  }
}
