import 'package:flutter/material.dart';

import '../daimention/daimentio n.dart';
import 'AppConstent.dart';
import 'appIcons.dart';

class ProfieleAvtar extends StatelessWidget {
  final bool showEditButton;
  final double? redias;
  final Widget? child;
  const ProfieleAvtar({this.showEditButton=false,this.redias,this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: redias,
      backgroundColor: AppConstant.themYellow,

      //
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: double.maxFinite,
        height: double.maxFinite,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),

        // Profile Image Replace
        child: Container(

          clipBehavior: Clip.hardEdge,
          width: double.maxFinite,
          height: double.maxFinite,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: child,
        ),
      ),
    );
  }
}
