import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/myMatchTileClosed.dart';
import 'package:guru_matka_new/component/myMatchTileLive.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class MyMatchScreen extends StatelessWidget {
  const MyMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: SizedBox(),
        title: Text("My Match"),
      ),

      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20
        ),
        children: [


          MyMatchTileLive(),
          
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SC.from_width(18)
            ),
            child: Text("Completed",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: SC.from_width(16)
            ),),
          ),

          for(int i =0;i<3;i++)
            Padding(
              padding:  EdgeInsets.only(
                bottom: SC.from_width(13)
              ),
              child: MyMatchTileClosed(),
            )

        ],
      ),

    );
  }
}
