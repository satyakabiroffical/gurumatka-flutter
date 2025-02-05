import 'package:flutter/material.dart';


class MySlideTr extends StatelessWidget {
  Offset? startPosition;
  Animation animation;
  Widget child;
  Curve? curve;
  bool revers;
  double intervel;
  double endInterver;
  MySlideTr({this.endInterver = 1,this.startPosition,this.curve,required this.animation,required this.child,this.intervel = 0,this.revers =false,super.key});

  @override
  Widget build(BuildContext context) {

    var tween = revers?Tween(begin: (startPosition==null)?Offset(-1,0):startPosition,end: Offset(0,0)): Tween(begin:(startPosition==null)?Offset(1,0):startPosition,end: Offset(0,0));

    return SlideTransition(
      position: animation.drive(tween.chain(CurveTween(curve: Interval(intervel,endInterver,curve: curve??Curves.fastOutSlowIn)))),
      child: child,
    );
  }
}