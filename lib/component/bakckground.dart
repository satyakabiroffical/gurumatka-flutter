import 'dart:ui';

import 'package:flutter/material.dart';


class BackGround extends StatelessWidget {
  final Widget? child;
  const BackGround({this.child,super.key});

  @override
  Widget build(BuildContext context) {

    var op = .2;

    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Column(
            children: [

              //
              Expanded(
                child: Opacity(opacity: op,
                    child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              ),

              //
              Expanded(
                child: Opacity(opacity: op,
                    child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              ),

              //
              // Expanded(
              //   child: Opacity(opacity: op,
              //       child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              // ),

              // Expanded(
              //   child: Opacity(opacity: op,
              //       child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              // )

            ],
          ),

          //
          Container(child:ColorFiltered(

            colorFilter:  ColorFilter.mode(Colors.grey, BlendMode.colorBurn),
            child: SizedBox(),

          ),),


          if(child!=null)
            child!,
        ],
      ),
    );
  }
}
