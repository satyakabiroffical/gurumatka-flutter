import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/withdrawHistoryTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class WithdrawHistoryScreen extends StatelessWidget {
  const WithdrawHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        appBar: AppBar(

          title: Text('Withdraw History'),
        ),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          children: [

            for(int i = 0;i<10;i++)
              Padding(
                padding: EdgeInsets.only(bottom: SC.from_width(22)),
                child: WithdrawHistoryTile(),
              )

          ],
        ),
      ),
    );
  }
}
