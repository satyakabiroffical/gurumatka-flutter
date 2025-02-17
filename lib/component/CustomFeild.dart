import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class CustomFeild extends StatelessWidget {
  final String label;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? formatters;
  final String? hintText;
  final String? Function(String?)? validator;
  const CustomFeild({this.validator,this.inputType,this.hintText,this.formatters,this.controller,required this.label,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //
        Text(label,
          style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: SC.from_width(14),
        ),
        ),
        SizedBox(height: SC.from_width(8),),

        //
        TextFormField(
          validator: validator,
          keyboardType: inputType,
          controller: controller,
          inputFormatters: formatters,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
              hintText: hintText),
        )
      ],
    );
  }
}
