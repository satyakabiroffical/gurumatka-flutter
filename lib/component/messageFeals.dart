import 'package:flutter/material.dart';

import '../daimention/daimentio n.dart';


class MessageField extends StatelessWidget {
  final void Function()? onPreffixTap;
  final void Function()? onSend;
  final TextEditingController? controller;
  const MessageField({this.onSend,this.onPreffixTap,this.controller,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      style: TextStyle(
        color: Colors.black
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Write a reply.....',


        //
        prefixIcon: IconButton(onPressed: onPreffixTap, icon: Icon(Icons.camera_alt_outlined,color: Colors.black,)),

        //
        suffixIcon: IconButton(onPressed: onSend, icon: CircleAvatar(
          backgroundColor: Color.fromRGBO(59, 48, 134, 1),
            child: Icon(Icons.send,color: Colors.white,size: 18,))),



        //
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: SC.from_width(12),
          fontWeight: FontWeight.w400,
        ),

        //
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none
        ),

        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none
        ),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          borderSide: BorderSide.none
        ),


      ),
    );
  }
}
