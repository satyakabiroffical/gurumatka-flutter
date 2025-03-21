

import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService
{

  final _messaging = FirebaseMessaging.instance;
  final _notification = FirebaseMessaging.instance;

  //
  Future<bool> getPermission() async
  {
    log("permmsion prosses");
    bool p = false;
    log("set fedalse");

    var req = await Permission.notification.request();

    if(req.isGranted)
      {
        p = true;
      }
    else
      {
        await AwesomeNotifications().requestPermissionToSendNotifications();

        var req = await Permission.notification.request();
        p = req.isGranted;

      }
    log("Permmsion n getted sussezfull stattus = $p");
    return p;
  }


  //
  Future<String?> getDeviceToken()async
  {
    var tok =  await _messaging.getToken();

    return tok;
}


//
initNotification() async
{


  await AwesomeNotifications().initialize(
      null, //'resource://drawable/res_app_icon',//
      [
        NotificationChannel(
            channelKey: 'channelKey',
            channelName: 'channelKey',
            channelDescription: 'Notification tests as alerts',
            playSound: true,
            onlyAlertOnce: true,
            groupAlertBehavior: GroupAlertBehavior.Children,
            importance: NotificationImportance.High,
            defaultPrivacy: NotificationPrivacy.Private,
            defaultColor: Colors.red,
            enableVibration: true,
            ledColor: Colors.deepPurple)
      ],
      debug: true);


  await _messaging.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  ReceivedAction? initialAction = await AwesomeNotifications()
      .getInitialNotificationAction(removeFromActionEvents: false);

  log("Init Notification Done");

}


//
setNotificatioListner()
{
  FirebaseMessaging.onMessage.listen((event) {
    log("Notification recever frome fireBase \n${event.notification?.title}\n${event.notification?.body}\n${event.data} \n${event.notification}");
    showNotification(event);
  },);
}


//
showNotification(RemoteMessage message) async
{

  AwesomeNotifications().createNotification(content: NotificationContent(
      id: 0,
      channelKey: "channelKey",
    title: message.notification?.title,
    body:  message.notification?.body,
  ));

}










}