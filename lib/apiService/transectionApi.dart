import 'dart:convert';
import 'dart:developer';

import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:http/http.dart' as http;

class TransactionApi
{

  Future<http.Response> transactionHistory({int page=1}) async {
    String uri = '${MyUrl.base}${MyUrl.transectionHistory}?page=$page';
    var toke =  await UserPref().getHeader();
    var resp = await http.get(Uri.parse(uri),
        headers:toke);

    log("${uri}\n${resp.statusCode}\n${resp.body}");
    return resp;
  }


  Future<http.Response> withdrawHistory({int page=1}) async {
    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.withdraw}?page=$page&userId=${user?.id??''}';
    var toke =  await UserPref().getHeader();

    var resp = await http.get(Uri.parse(uri),
        headers:toke);

    log("${uri}\n${resp.statusCode}\n${resp.body}");
    return resp;
  }


  //
  Future<http.Response> createWithdrawRequest({
    String? amount,
    String? bankName,
    String? accountHolderName,
    String? mobileNumber,
    String? ifscCode,
    String? accountNumber,
  }) async {
    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.createWithdraw}';
    var toke =  await UserPref().getHeader();

    var resp = await http.post(Uri.parse(uri),
        body: jsonEncode({
          "ammount":amount,
          "bankName":bankName,
          "bankAccountNumber": accountNumber,
          "name": accountHolderName,
          "mobileNumber": mobileNumber,
          "ifscCode": ifscCode,
          "userId":user?.id
        }),
        headers:toke);

    log("${uri}\n${resp.statusCode}\n${resp.body}");
    return resp;
  }

  //
  Future<http.StreamedResponse> addAmmountInWalletRequest({

    String? amount,
    String? transactionId,
    String? ss,

  }) async {
    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.addDiposit}';
    var toke =  await UserPref().getHeaderSimple();

    var data = {
      "amount":amount??'',
      'transactionId':transactionId??'',
      "userId":user?.id??''
    };

    
    var req = http.MultipartRequest("POST", Uri.parse(uri));

    req.headers.addAll(toke??{});

    req.fields.addAll(data);

    req.files.add(await http.MultipartFile.fromPath("ss", ss??''));

    var resp = await req.send();

    log("${uri}\n${resp.statusCode}");
    return resp;
  }



  //
  Future<http.Response> getAllTransectionHistory({int page=1}) async {
    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.getAllTransection}?page=$page&userId=${user?.id??''}';
    var toke =  await UserPref().getHeader();

    var resp = await http.get(Uri.parse(uri),
        headers:toke);

    log("${uri}\n${resp.statusCode}\n${resp.body}");
    return resp;
  }





}