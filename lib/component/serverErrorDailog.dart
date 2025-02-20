
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';

serverErrorWidget(BuildContext context,String data,{String? title})
{
  OpenDailovgWithAnimation(context, dailog: AlertDialog(
    title: Text(title??"Server Error"),
     content:  HtmlWidget(data)
  ));
}