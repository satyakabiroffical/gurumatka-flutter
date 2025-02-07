import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final double? height;
  final bool waiting;
  final double? width;
  final void Function()? onTap;
  const CustomButton({this.waiting = false,this.onTap,this.width,this.height,required this.title ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular((height!=null)?height!/2:SC.from_width(49)/2),
        side: BorderSide(
          color: Colors.black,
        )
      
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Ink(
        height: height??SC.from_width(49),
        width: width??double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white,
            AppConstant.themYellow,
          ])
        ),
        child: InkWell(
          splashColor: Color.fromRGBO(240, 167, 30, .5),
          onTap:onTap,
            child: Center(child:
            (waiting)?
                CircularProgressIndicator():
            Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: SC.from_width(16),color: Colors.black),))),
      ),
    );
  }
}
