import 'package:flutter/material.dart';

import '../daimention/daimentio n.dart';


class WinnerAvatar extends StatelessWidget {
  final Color? color;
  final double size;
  final bool? isWinner;
  final int num;
  final Widget? child;
  const WinnerAvatar({this.isWinner,this.child,this.color,this.size = 74,this.num=0,super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: SC.from_width(size),
      height: SC.from_width(size),
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [




          //
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(4),
              clipBehavior:Clip.hardEdge,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),

              //Image P
              child: child,
            ),
          ),

          //
          Positioned(
            bottom: -SC.from_width(28/2),
            left: SC.from_width((size/2)-28),
            right: SC.from_width((size/2)-28),
            child: Container(
              height: SC.from_width(28),
              width: SC.from_width(28),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(50, 34, 68, 1),
                  shape: BoxShape.circle
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(5),
                child:Text("$num",
                  style: TextStyle(
                    color: Colors.black,

                  ),),
                decoration: BoxDecoration(
                    color:
                    color,
                    shape: BoxShape.circle
                ),
              ),
            ),
          ),

          //
          if(isWinner??false)
            Positioned(
              top: -SC.from_width(60),
              left: SC.from_width(10),
              right: SC.from_width(10),
              child: Container(height: SC.from_width(90),
                width: SC.from_width(90),
                

                child: Image.asset('assets/icons/winnerCorwn.png'),
              ),
            ),


        ],
      ),
    );
  }
}
