import 'dart:convert';

import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:http/http.dart' as http;

class HomeApi
{


  Future<http.Response>getHome() async
  {

    String uri = '${MyUrl.base}${MyUrl.getBanner}';
    var toke = await UserPref().getHeaderSimple();
    var resp = await http.get(Uri.parse(uri),
        headers: toke
    );
    return resp;
  }


}