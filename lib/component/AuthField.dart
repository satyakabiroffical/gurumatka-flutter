import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class AuthField extends StatelessWidget {
  final String? hintText;
  final Widget? prefix;
  final TextInputType? keyBoardtype;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  const AuthField(
      {this.keyBoardtype,this.prefix,this.inputFormatters, this.validator,this.controller, this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      //
      controller: controller,

      //
      validator: validator,

      keyboardType: keyBoardtype,

      //
      inputFormatters: inputFormatters,


      //
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w400,
          fontSize: SC.from_width(14)),


      //
      decoration: InputDecoration(
        
        //
        prefixIcon: prefix,



          //
          hintText: hintText,

          //
          hintStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(14)),

          //
          filled: true,

          //
          fillColor: Color.fromRGBO(48, 49, 51, 1),


          //
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white,
                width: .5
            ),
            borderRadius: BorderRadius.circular(100),
          ),

          //
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.white,
                width: .5
            ),
            borderRadius: BorderRadius.circular(100),
          ),

          //
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2
              ),
              borderRadius: BorderRadius.circular(100),
          )
      ),
    );
  }
}
