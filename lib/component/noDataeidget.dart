import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';



class NoDataWidget extends StatelessWidget {
  final String lable;
  const NoDataWidget({this.lable='No Data',super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(aspectRatio: 1,child: SizedBox(
      width: double.infinity,
        child: Center(child: Text(lable,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: SC.from_width(20)
        ),),
        )),);
  }
}
