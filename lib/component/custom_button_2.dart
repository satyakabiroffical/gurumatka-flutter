import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class CustomButton2 extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final bool showBorder;
  final void Function()? onTap;
  const CustomButton2({this.showBorder = true,this.color,this.onTap,this.width,this.height,required this.title ,super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular((height!=null)?height!/2:SC.from_width(49)/2),
        side: showBorder?BorderSide(
          color: Colors.black,
        ):BorderSide.none
      ),
      color: color??AppConstant.themGrey,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Ink(
        height: height??SC.from_width(49),
        width: width??double.infinity,
        child: InkWell(
            splashColor: Colors.grey,
            onTap:onTap,
            child: Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: SC.from_width(16),color: Colors.white),))),
      ),
    );
  }
}
