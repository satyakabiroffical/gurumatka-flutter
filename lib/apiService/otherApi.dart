import 'dart:convert';
import 'dart:developer';

import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:guru_matka_new/screens/drawerscreens/how_to_play_screen.dart';
import 'package:http/http.dart' as http;

class OtherApi{



  //
  Future<http.Response>getUpiCode()async
  {
    String uri = '${MyUrl.base}${MyUrl.getUpiBarcode}';

    var toke = await UserPref().getHeader();

    var resp = await http.get(Uri.parse(uri),
    headers: toke);
    log('$uri\n${resp.statusCode}\n${resp.body}');

    return resp;
  }


  //
  Future<http.Response>getThreadId()async
  {
    String uri = '${MyUrl.base}${MyUrl.getThreadId}';

    var toke = await UserPref().getHeader();
    var user = await UserPref().getUser();


    var resp = await http.post(Uri.parse(uri),
        body: jsonEncode({
          'userId':user?.id??'',
        }),
        headers: toke);
    log('$uri\n${resp.statusCode}\n${resp.body}');

    return resp;
  }


  //
  Future<http.Response>getChat(String threadId,{int page = 1})async
  {
    String uri = '${MyUrl.base}${MyUrl.getChat}=$threadId&page=$page';

    var toke = await UserPref().getHeader();
    var resp = await http.get(Uri.parse(uri),
        headers: toke);
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }

  //

  Future<http.Response>exchangeCommission()async
  {
    String uri = '${MyUrl.base}${MyUrl.commisionConvertWallet}';

    var toke = await UserPref().getHeader();
    var user = await UserPref().getUser();
    var resp = await http.put(Uri.parse(uri),
        body: jsonEncode({
          '_id': user?.id??''
        }),
        headers: toke);
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }


  Future<http.Response>howToPlay()async
  {
    String uri = '${MyUrl.base}${MyUrl.howToPlay}';

    var toke = await UserPref().getHeader();

    //
    var resp = await http.get(
      Uri.parse(uri),
        headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }

  Future<http.Response>getNotificationCount()async
  {
    var user = await UserPref().getUser();

    String uri = '${MyUrl.base}${MyUrl.getNotification}?userId=${user?.id??''}';

    var toke = await UserPref().getHeader();

    //
    var resp = await http.get(
      Uri.parse(uri),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }



}