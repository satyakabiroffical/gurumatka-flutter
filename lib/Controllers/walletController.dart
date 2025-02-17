
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/models/barcodeResompce.dart';
import 'package:image_picker/image_picker.dart';

class WalletProvider with ChangeNotifier
{

  final otherApi = OtherApi();
  bool _loadingWallet = true;
  GetBarcodResponce? _walletData;
  TextEditingController _transectionIdController= TextEditingController();
  TextEditingController _amountController= TextEditingController();
  String? _screenShot ;

  TextEditingController get transectionIdController=> _transectionIdController;
  TextEditingController get amountController=> _amountController;
  String? get screenShot=>_screenShot;
  bool get loadingWallet =>_loadingWallet;
  GetBarcodResponce? get walletData=> _walletData;


  getQR(BuildContext context)async
  {
    _loadingWallet = true;

    var resp =  await otherApi.getUpiCode();


    switch(resp.statusCode)
    {
      case 200:
        var _d = jsonDecode(resp.body);
        _walletData = GetBarcodResponce.fromJson(_d);
        break;

      case 401:
        log("TokenExpire");
        break;

      default :
        log("${resp.statusCode}\n${resp.body}");
        break;
    }

    _loadingWallet = false;
    notifyListeners();



  }



  clear()async
  {
    _loadingWallet = true;
    _walletData =null;
    _transectionIdController.clear();
    _amountController.clear();
    _screenShot = null;
  }


}