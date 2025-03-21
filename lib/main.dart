

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/Controllers/allTransectionprovider.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/Controllers/game%20provider.dart';
import 'package:guru_matka_new/Controllers/homeProvider.dart';
import 'package:guru_matka_new/Controllers/leaderBoardProvider.dart';
import 'package:guru_matka_new/Controllers/my%20betting%20provider.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/Controllers/resulteProvider.dart';
import 'package:guru_matka_new/Controllers/transection%20provider.dart';
import 'package:guru_matka_new/Controllers/walletController.dart';
import 'package:guru_matka_new/Controllers/withdrawProvider.dart';
import 'package:guru_matka_new/apiService/transectionApi.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/transectionhistory%20responce.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/onBord.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import 'Controllers/chat_provider.dart';

void main() async
{
   await WidgetsFlutterBinding.ensureInitialized();

   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp,
   ]);

   await Firebase.initializeApp();


   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider(),),
    ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ChangeNotifierProvider(create: (context) => ProfileProvider(),),
    ChangeNotifierProvider(create: (context) => WalletProvider(),),
    ChangeNotifierProvider(create: (context) => SocketProvider(),),
    ChangeNotifierProvider(create: (context) => TransectionProvider(),),
    ChangeNotifierProvider(create: (context) => WithdrawProvider(),),
    ChangeNotifierProvider(create: (context) => LeaderBoardProvider(),),
    ChangeNotifierProvider(create: (context) => AllTransectionProvider(),),
    ChangeNotifierProvider(create: (context) => GameProvider(),),
    ChangeNotifierProvider(create: (context) => ResultProvider(),),
    ChangeNotifierProvider(create: (context) =>MyBettingProvider(),),
  ],
  child: MyApp(),));
}



@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();


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





  ReceivedAction? initialAction = await AwesomeNotifications()
      .getInitialNotificationAction(removeFromActionEvents: false);

  if(initialAction!=null)
    {

      Logger().i("Acction Heppend ${initialAction.actionDate}");
    }


  AwesomeNotifications().createNotification(content: NotificationContent(
      id: 0,
      channelKey: "channelKey",
    title: message.notification?.title,
    body: message.notification?.body
  ));


  // showFlutterNotification(message);
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(


        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppConstant.themGrey,

          //
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.black
            )
          ),


          hintStyle: TextStyle(
            color: Colors.grey.shade500,
            fontWeight: FontWeight.w400,
            fontSize: SC.from_width(16)
          ),

          //
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),

          disabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),

          outlineBorder: BorderSide(
            color: Colors.black
          ),

          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),


          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.black
              )
          ),



          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.red
              )
          ),

          errorStyle: TextStyle(
            color: Colors.red
          )


        ),

        colorScheme: ColorScheme.dark(
          primary: AppConstant.themYellow
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(),

        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.white
          ),

          //
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),

        //
        iconTheme: IconThemeData(
          color: Colors.white
        ),



        //
        scaffoldBackgroundColor: Colors.transparent

      ),

      home: OnBoard(),
    );
  }
}
