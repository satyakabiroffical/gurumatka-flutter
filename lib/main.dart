

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/onBord.dart';

void main()
{
  runApp(MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    return MaterialApp(

      theme: ThemeData(

        colorScheme: ColorScheme.dark(
          primary: AppConstant.themYellow
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(

        ),

        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          centerTitle: true,
          actionsIconTheme: IconThemeData(
            color: Colors.white
          ),

          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),

        iconTheme: IconThemeData(
          color: Colors.white
        ),


        scaffoldBackgroundColor: Colors.transparent

      ),

      home: OnBoard(),
    );
  }
}
