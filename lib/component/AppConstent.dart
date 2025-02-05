
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../daimention/daimentio n.dart';

class AppConstant  {
  
  // static Color themYellow = Color.fromRGBO(240,167,30,1);
  static Color themYellow = Color.fromRGBO(240, 167, 30, 1);
  static BoxDecoration greyBoxDecoration = BoxDecoration(
      color: Colors.grey.shade900,
      borderRadius: BorderRadius.circular(8),
      border: Border.all()
  );

  static BoxDecoration buttonDecoration = BoxDecoration(
      gradient: LinearGradient(colors: [
        Colors.white,
        AppConstant.themYellow,
      ])
  );



  TextStyle largeWhitText()
  {
    return TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: SC.from_width(24));
  }

}