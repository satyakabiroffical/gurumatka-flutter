
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/notificationTile.dart';
import 'package:guru_matka_new/models/getNotificationREsponce.dart';


class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  getMoreNotification()
  {

  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
      
        appBar: AppBar(
          title: Text('Notifications'),
        ),

        body:FutureBuilder(future: OtherApi().getNotificationOfUser(), builder: (context, snapshot) {

          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);
            }
          if(snapshot.hasError)
          // if(true)
            {
              return Center(child: HtmlWidget("Error:\n${snapshot.error}"),);
            }
          if(snapshot.data?.statusCode==200)
            {
              GetNotificationResponce notificationResponce = GetNotificationResponce.fromJson(jsonDecode(snapshot.data?.body??''));

              if(notificationResponce.data!=null&& notificationResponce.data!.length>0)
                {
                  return  ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    children: [
                      for(var n in notificationResponce.data!)
                        NotificationTile(notification: n,),
                    ],
                  );
                }

              else
                {
                  return Center(child: Text("No Notification"),);
                }



            }


          return Center(child: HtmlWidget("Un Expected Error :\n${snapshot.error}"),);



        },),
      ),
    );
  }
}
