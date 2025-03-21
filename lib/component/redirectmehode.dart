import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/login.dart';

redirectToLogInPage(BuildContext context) async
{
  ReplaceAll(context, child: (p0, p1) => LoginScreen(animation: p0),);
}