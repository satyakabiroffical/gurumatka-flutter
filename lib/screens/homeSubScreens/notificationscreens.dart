
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/notificationTile.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
      
        appBar: AppBar(
          title: Text('Notifications'),
        ),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          children: [
            for(int i =0;i<10;i++)
              NotificationTile()
          ],
        ),
      ),
    );
  }
}
