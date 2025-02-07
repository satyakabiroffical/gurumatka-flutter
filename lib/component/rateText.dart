import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';



class RateText extends StatelessWidget {
  final String data;
  const RateText({required this.data,super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        //
        Text('₹',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize:SC.from_width(18)
        ),),


        //
        Text(
            data,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize:SC.from_width(24)
            )
        ),

      ],
    );

    return RichText(text: TextSpan(
      text: '₹',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize:SC.from_width(18)
          ),
          children: [
            TextSpan(
              text: data,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize:SC.from_width(24)
              )
            )
        ]
    ));
  }
}
