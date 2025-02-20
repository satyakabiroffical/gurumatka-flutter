

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:guru_matka_new/apiService/transectionApi.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/models/altransection.dart';
import 'package:guru_matka_new/models/transectionhistory%20responce.dart';
import 'package:image_picker/image_picker.dart';

import '../component/serverErrorDailog.dart';

class AllTransectionProvider with ChangeNotifier
{
  final _transectionApi = TransactionApi();

  bool _loading = true;
  bool _loadingMore = false;
  List<AllTransection> _transactions = [];


  int _page = 1;





  bool get loading =>_loading;
  bool get loadingMore =>_loadingMore;
  List<AllTransection> get transactions =>_transactions;






  //
  getTransection(BuildContext context) async
  {

    _loading = true;
    _page= 1;
    var resp = await _transectionApi.getAllTransectionHistory();

    switch(resp.statusCode)
    {
    //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = AllTransectionResponce.fromJson(_d);
        if(_data.data!=null&&_data.data!.isNotEmpty)
        {
          _transactions = _data.data??[];
          _page++;
        }
        break;

      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

    //
      default :
        break;
    }

    _loading = false;
    notifyListeners();
  }

  loadMore(BuildContext context) async
  {

    _loadingMore = true;
    notifyListeners();
    var resp = await _transectionApi.getAllTransectionHistory(page: _page);

    switch(resp.statusCode)
    {
    //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = AllTransectionResponce.fromJson(_d);
        if(_data.data!=null&&_data.data!.isNotEmpty)
        {
          _transactions.addAll(_data.data??[]) ;

          _page++;
        }
        break;

      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

    //
      default :
        break;
    }


    _loadingMore = true;
    notifyListeners();

  }

  //







  //




  //
  clear() async
  {
    _page =1;
    _transactions = [];
    _loading = true;

  }


}