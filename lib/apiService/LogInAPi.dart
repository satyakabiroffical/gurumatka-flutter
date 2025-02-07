import 'dart:developer';

import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:http/http.dart' as http;

class AuthApi
{
  final paths = MyUrl();


  //
  Future<http.Response> sendOtpToMobileNumber(String number) async
  {
    log(number);

    var data = {
      'phoneNumber': number
    };

    String uri = '${MyUrl.base}${MyUrl.sendOtp}';
    log("${data}\n$uri");
    var resp = await http.post(
      Uri.parse(uri),
        body:data,
    );

    return resp;
  }



  //
  Future<http.Response> verifyOtp(String number,String otp) async
  {

    String uri = '${MyUrl.base}${MyUrl.verifyOtp}';

    var resp = await http.post(Uri.parse(uri),body:{
      'phoneNumber':number,
      'otp':otp
    });

    return resp;
  }

}