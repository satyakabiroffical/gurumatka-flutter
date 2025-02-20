import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/customFormater.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/chat_resp.dart';


class MyChatBubble  extends StatelessWidget {

  final Message message;
  const MyChatBubble ({required this.message,super.key});

  @override
  Widget build(BuildContext context) {
    final isSender= message.type=="USER" ;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: (isSender)?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          BubbleSpecialOne(
            
            text: message.message??'',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("${CustomFormat().formatTime(message.createdAt!.add(Duration(minutes: 330)))}",
            style: TextStyle(fontWeight: FontWeight.w600,fontSize: SC.from_width(10)),),
          )
        ],
      ),
    );
  }
}
