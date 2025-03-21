import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';

commingSoon(BuildContext context)
{

  OpenDailovgWithAnimation(context, dailog: Center(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text("Comming Soon",
          textAlign: TextAlign.center,

          style: TextStyle(


            //
            fontWeight: FontWeight.w700,

            //
            fontSize: SC.from_width(30),

            //

          ),),
      ),
    ),
  ));

}