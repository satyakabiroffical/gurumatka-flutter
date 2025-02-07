import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class DrawerTile extends StatelessWidget {
  final Widget? icon;
  final String label;
  final void Function()? onTap;
  const DrawerTile({this.onTap,this.icon,required this.label,super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,

      leading: icon,
      
      title: Text(label),

      titleTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: SC.from_width(16)
        
      ),
      
    );
  }
}
