import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/GamsScreens/games_Screens.dart';
import 'package:guru_matka_new/screens/daboard/home/drawer.dart';
import 'package:guru_matka_new/screens/homeSubScreens/notificationscreens.dart';
import 'package:guru_matka_new/screens/walletscreens/walletSCreend.dart';

import '../../../component/appIcons.dart';
import '../../../component/provfileAvtar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.transparent,



      drawer: AppDrawer(),


      //
      appBar: AppBar(

        //
        centerTitle: true,

        //Profile Image
        leading: Builder(
          builder: (context) => IconButton(
            icon:ProfieleAvtar(
              redias: SC.from_width(52),
              child: Hero(
                tag: AIcon.sampleProfile,
                child: Image.asset(AIcon.sampleProfile,
                  fit: BoxFit.cover,),
              ),
            ), // Custom drawer icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Works inside Builder
            },
          ),
        ),
        
        title: Image.asset("assets/mainImage/splashScreenLogo.png",height: SC.from_width(73),),
        
        actions: [
          
          //wallet 
          IconButton(
              onPressed: (){
                RouteTo(context, child: (p0, p1) => WalletScreen(),);
              },
              icon: Icon(Icons.wallet)
          ),

          //
          IconButton(
              onPressed: (){
                RouteTo(context, child: (p0, p1) => NotificationScreen(),);
              },
              icon: Icon(Icons.notifications)
          ),
        ],
        
      ),


      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [

          //
          SizedBox(height: SC.from_width(24),),
          Image.asset('assets/homeImage/home1.png'),
          SizedBox(height: SC.from_width(24),),


          //
          Text("Live Games",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: SC.from_width(18),
          ),),
          SizedBox(height: SC.from_width(7),),
          
          //
          GestureDetector(
            onTap: (){
              RouteTo(context, child: (p0, p1) => GamesScreen(),);
            },
              child: Image.asset('assets/homeImage/home2.png'))



        ],
      ),

    );
  }
}
