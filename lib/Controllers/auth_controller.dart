


import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/LogInAPi.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/Otp.dart';

class AuthProvider with ChangeNotifier
{
  final _auth = AuthApi();
  bool _sending = false;
  TextEditingController _numberController = TextEditingController();


  TextEditingController get numberController =>_numberController;
  bool get sending => _sending;



  sentOtp(BuildContext context) async
  {
    log('${_numberController.text}');
    if(_numberController.text.trim().length==10)
      {
        var resp = await _auth.sendOtpToMobileNumber(_numberController.text.trim());

        switch(resp.statusCode)
            {
          case 201:
            RouteTo(context, child: (p0, p1) => OtpScreen(animation: p0),);
            break;


          default :
            log('${resp.statusCode}\n${resp.body}');
            break;
        }

      }
  }

}