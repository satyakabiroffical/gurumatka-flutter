import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class ProfileField extends StatelessWidget {
  final String? hintText;
  final Widget? prefix;
  final TextInputType? keyBoardtype;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final void Function()? onTap;
  const ProfileField (
      {this.onTap,this.enable = true,this.keyBoardtype,this.prefix,this.inputFormatters, this.validator,this.controller, this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(



      onTap: onTap,

      //
      controller: controller,

      //
      validator: validator,

      keyboardType: keyBoardtype,

      //
      inputFormatters: inputFormatters,

      //
      enabled: enable,


      //
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: SC.from_width(14)),


      //
      decoration: InputDecoration(


        //
          prefixIcon: prefix,



          //
          labelText: hintText,

          //
          labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(14)),

          //
          filled: false,

          //
          fillColor: Color.fromRGBO(48, 49, 51, 1),

          //
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white
            )
          ),

          disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),

          //
          focusedBorder:  UnderlineInputBorder(
      borderSide: BorderSide(
      color: Colors.white
      )
    ),

          //
          border: UnderlineInputBorder(
      borderSide: BorderSide(
      color: Colors.white
      )
    )
      ),
    );
  }
}
