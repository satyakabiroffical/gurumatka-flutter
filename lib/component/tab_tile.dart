import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class TabTile extends StatelessWidget {
  final bool active;
  final String label;
  const TabTile({required this.label ,this.active = true,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SC.from_width(10)),

      decoration: active?BoxDecoration(
        color: AppConstant.themGrey,
        borderRadius: BorderRadius.circular(SC.from_width(50))
      ):null,

      alignment: Alignment.center,
      child: Text(label,style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: SC.from_width(19),
      ),),
    );
  }
}
