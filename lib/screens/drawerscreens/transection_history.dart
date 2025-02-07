import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/DipositHistoryTile.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/withdrawHistoryTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class TransectionHistory extends StatelessWidget {
  const TransectionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        
        appBar: AppBar(
          title: Text("History"),
        ),

        body: ListView(
          padding: EdgeInsets.all(20),
          children: [

            DipositHistoryTile(),
            SizedBox(height: SC.from_width(13),),
            WithdrawHistoryTile()

          ],
        ),
        
      ),
    );
  }
}
