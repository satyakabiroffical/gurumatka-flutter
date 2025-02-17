import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

showMessage(BuildContext context,String message,{bool warning = true})
{
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: Duration(seconds: 1),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: (warning)?Colors.red:Colors.green,
          borderRadius: BorderRadius.circular(8)
        ),
        child: Text(message,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SC.from_width(14),
          color: Colors.white
        ),),
      )),

  );
}