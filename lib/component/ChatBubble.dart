import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class MyChatBubble  extends StatelessWidget {
  final isSender;
  final String text;
  const MyChatBubble ({this.text='',this.isSender=false,super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: BubbleSpecialOne(
        text: text,
        tail: true,

        sent: false,
        color: (isSender)?Colors.white:Color.fromRGBO(127, 221, 83, 1),
        isSender: isSender,
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: SC.from_width(14),
          color: isSender?Color.fromRGBO(83, 88, 122, 1):null,
        ),
      ),
    );
  }
}
