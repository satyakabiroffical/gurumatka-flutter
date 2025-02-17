import 'dart:convert';
import 'dart:developer';

import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:http/http.dart' as http;

class AuthApi
{
  final paths = MyUrl();


  //
  Future<http.Response> sendOtpToMobileNumber(String number) async
  {
    log(number);

    var data = {
      'phoneNumber': '$number'
    };

    String uri = '${MyUrl.base}${MyUrl.sendOtp}';
    log("${data}\n$uri");
    var resp = await http.post(
      Uri.parse(uri),
        headers: {
          'Content-Type': 'application/json'
        },
        body:jsonEncode(data),
    );

    return resp;
  }



  //
  Future<http.Response> verifyOtp(String number,String otp) async
  {

    String uri = '${MyUrl.base}${MyUrl.verifyOtp}';

    var resp = await http.post(Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body:jsonEncode({
          'phoneNumber':number,
          'otp':otp
        }));

    return resp;
  }


  Future<http.Response> getUserProfile() async
  {

    String uri = '${MyUrl.base}${MyUrl.getUserProfile}';
    var toke =  await UserPref().getHeader();
    var resp = await http.get(Uri.parse(uri),
    headers:toke);
    return resp;
  }



  Future<http.Response> updateUser({
    String? name,
    String? email,
    String? address,
    String? dob,
    String? gender,
}) async
  {

    String uri = '${MyUrl.base}${MyUrl.updateUserProfile}';


    var data = {
      "userName":name,
      "email":email,
      "address":address,
      "dob":dob,
      "gender": gender //'MALE', 'FEMALE', or 'OTHER'",
    };

    log("data from Update user \n $data");

    var toke =  await UserPref().getHeader();
    var resp = await http.put(Uri.parse(uri),
        body: jsonEncode(data),
        headers:toke);

    return resp;
  }


  Future<http.StreamedResponse> updateUserProfilePicture(String image) async
  {

    String uri = '${MyUrl.base}${MyUrl.profileImageUpdate}';

    log(uri);

    var toke =  await UserPref().getHeader();

    var request = http.MultipartRequest(
      'PUT',
      Uri.parse(uri), // Replace with your API URL
    );

    request.files.add(
      await http.MultipartFile.fromPath('image', image),
    );

    request.headers.addAll(toke!);


    var resp = await request.send();

    return resp;
  }


  logOut() async {
    String uri = '${MyUrl.base}${MyUrl.logOut}';
    var toke =  await UserPref().getHeader();
    var resp = await http.post(Uri.parse(uri),
        headers:toke);

    return resp;
  }

  Future<http.Response>getUserAppInfo() async {
    String uri = '${MyUrl.base}${MyUrl.userAppInfo}';
    var toke =  await UserPref().getHeader();
    var resp = await http.get(Uri.parse(uri),
        headers:toke);

    return resp;
  }

  Future<http.Response>getCompany() async {
    String uri = '${MyUrl.base}${MyUrl.userGetCompany}';
    var toke =  await UserPref().getHeader();
    var resp = await http.get(Uri.parse(uri),
        headers:toke);

    return resp;
  }



}