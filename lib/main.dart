

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/onBord.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthProvider(),)
  ],
  child: MyApp(),));
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    return MaterialApp(

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

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Colors.black
              )
          )


        ),

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
