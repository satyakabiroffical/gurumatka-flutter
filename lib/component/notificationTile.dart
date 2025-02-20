import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/customFormater.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/getNotificationREsponce.dart';

class NotificationTile extends StatelessWidget {
  final UserNotification? notification;
  const NotificationTile({this.notification,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: SC.from_width(9)),
      margin: EdgeInsets.only(
        bottom: SC.from_width(13)
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(4)
      ),
      child:   Stack(
        clipBehavior: Clip.none,
        children: [
          
          Positioned(
            top: -SC.from_width(5),
          right: SC.from_width(5),
              child:  Text("${CustomFormat().getFormateDuration(notification!.createdAt!)}",style: TextStyle(
              fontSize: SC.from_width(15),
              fontWeight: FontWeight.w600,
              color: AppConstant.themYellow
          ))),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              //
              Container(
                margin: EdgeInsets.only(
                    right: SC.from_width(6)
                ),
                height: SC.from_width(67),
                width: SC.from_width(5),
                decoration: BoxDecoration(
                    color: AppConstant.themYellow,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight : Radius.circular(6),
                    )
                ),
              ),
          
              //
              Expanded(child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    '${notification?.title??'No Title'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SC.from_width(14),
                    ),),

                  //
                  Text(
                    '${notification?.description??'No Description'}',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(14),
                    ),),
                ],
              )),
          
          
          
              SizedBox(width: SC.from_width(30),)
          
            ],
          ),
        ],
      ),
    );
  }
}
