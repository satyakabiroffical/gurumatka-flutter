import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/verifyOTpREsponce.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/roun%20animation%20configration.dart';
import 'package:guru_matka_new/push_notification/notification%20service.dart';
import 'package:guru_matka_new/screens/daboard/home/homeScreen.dart';
import 'package:guru_matka_new/screens/daboard/navigation%20screens.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/login.dart';
import 'package:provider/provider.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp(context);
  }

  Future<User?> startApp(BuildContext context) async
  {
    print("start");
    bool p = await NotificationService().getPermission();


if(p)
  {

    print("Notiijnitlizing ");
    await NotificationService().initNotification();
    print("setting Listner");
    NotificationService().setNotificatioListner();
  }

    var user =  await UserPref().getUser();

    if(user!=null)
      {
        print("Nvigation to screen now");
        Timer(Duration(seconds: 3),() {

          print("Going to dashboard");

          //
          ReplaceTo(context, child: (p0, p1) => NavigationScreen(),);

        },);
      }
    else
      {
         showStartButton = true;
         setState(() {

         });
      }

    return user;

  }

  bool showStartButton = false;

  @override
  Widget build(BuildContext context) {
    return BackGround(


      child: Scaffold(

        body: Stack(
          children: [

            //
            Center(
              heightFactor: 1.4,
                child: Image.asset("assets/mainImage/splashScreenLogo.png",width: SC.from_width(312),)),

            //
            Center(
                child: Image.asset("assets/mainImage/sp1.png",width: SC.from_width(93),)),

            //
            Positioned(
              bottom: SC.from_width(300),
                left: SC.from_width(44),
                child: Image.asset("assets/mainImage/sp2.png",width: SC.from_width(83),)),

            //
            Positioned(
              bottom: SC.from_width(300),
              right: SC.from_width(44),
                child: Image.asset("assets/mainImage/sp3.png",width: SC.from_width(83),)),

            //
            if(showStartButton)
              Positioned(
              bottom: SC.from_width(158),
              left: SC.from_width(31),
              right: SC.from_width(31),
              child: CustomButton(
                onTap: ()async{
                  ReplaceTo(context, child: (p0, p1) => LoginScreen(animation: p0),);
                },
                title: "Start Now",
              ),
            )



            //
            // CustomButton(
            //   onTap: ()async{
            //     startApp(context);
            //   },
            //   title: "Start Now",
            // ),








          ],
        ),
      ),
    );
  }
}
