

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:guru_matka_new/apiService/homeApiu.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/models/homeResponce.dart';

class HomeProvider with ChangeNotifier
{
  final _homeApi = HomeApi();
  bool _isLoading = true;
  List<String> _banners  = [];
  String? _mainBanners;

  List<String> get banners  => _banners;
  String? get mainBanners=>_mainBanners;
  bool get isLoading => _isLoading;

  getHome(BuildContext context) async
  {
    _isLoading = true;
    var resp =  await _homeApi.getHome();
    log("responce from get Home\n${resp.statusCode}\n${resp.body}");
    switch(resp.statusCode)
        {
      case 200:
        var _d = jsonDecode(resp.body);
        var _homeData = HomeResponce.fromJson(_d);
        _banners = _homeData.data?.banner??[];
        _mainBanners = _homeData.data?.gameBanner;
        break;

      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

      default:
        log("responce from get Home\n${resp.statusCode}\n${resp.body}");
        break;
    }
    _isLoading  = false;
    notifyListeners();
  }

  clear()
  {
    _banners = [];
    _mainBanners = null;
    _isLoading = true;
  }

}