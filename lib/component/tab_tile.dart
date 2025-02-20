import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class TabTile extends StatelessWidget {
  final bool active;
  final String label;
  final void Function()? onTap;
  const TabTile({this.onTap,required this.label ,this.active = true,super.key});

  @override
  Widget build(BuildContext context) {

    //
    return Card(

      clipBehavior: Clip.hardEdge,

      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SC.from_width(50)),

      ),

      color: Colors.transparent,
      elevation: 0,
      child: Ink(

        decoration: active?BoxDecoration(
          color: AppConstant.themGrey,
          borderRadius: BorderRadius.circular(SC.from_width(50))
        ):null,

        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Text(label,style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SC.from_width(19),
              ),),
            ),
          ),
        ),
      ),
    );
  }
}
