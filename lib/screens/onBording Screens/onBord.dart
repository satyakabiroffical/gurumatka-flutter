import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/roun%20animation%20configration.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/login.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

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
            Positioned(
              bottom: SC.from_width(158),
                left: SC.from_width(31),
                right: SC.from_width(31),
                child: CustomButton(
                  onTap: ()async{
                    RouteTo(context, child: (p0, p1) => LoginScreen(animation: p0,),);
                  },
                    title: "Start Now")),




          ],
        ),
      ),
    );
  }
}
