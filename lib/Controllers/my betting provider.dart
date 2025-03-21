import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/models/my_betting_responce_model.dart';

class MyBettingProvider with ChangeNotifier {
  bool _loading = true;
  bool _loadingMore = false;
  List<MyBettingData> _data = [];
  int _page = 1;
  int _totalPage = 1;
  String? _cuFilter;
  List<String> _filters = ["JODI",'CROSSING','HARUF'];
  Map<String,dynamic> _dData = {};

  bool get loading => _loading;
  bool get loadingMore => _loadingMore;
  List<MyBettingData> get data => _data;
  int get page => _page;
  Map<String,dynamic>get dData=>  _dData;
  List<String> get filters => _filters;
  int get totalPage  => _totalPage;

  loadBatting(BuildContext context,{bool refresh = false}) async {
    _loading = true;
    _page = 1;
    _totalPage = 1;
    if(refresh)
      {
        notifyListeners();
      }

    var resp = await OtherApi().getUserBetting(filter: _cuFilter);

    switch(resp.statusCode)
    {
      //
      case 200:
        var d = jsonDecode(resp.body);
        var _respData  =  UserBettingResponceModel.fromJson(d);
        if(_respData.data!=null&&_respData.data!.isNotEmpty)
          {
            _data = _respData.data??[];
            _totalPage = _respData.page??1;
            _page ++;
          }
        _dData = d;
        break;


      case 500:
        serverErrorWidget(context, resp.body);
        break;

    }


    _loading = false;
    notifyListeners();

  }


  loadMore(BuildContext context) async {
    if(_page<=_totalPage)
      {



        _loadingMore = true;
        notifyListeners();

        var resp = await OtherApi().getUserBetting(filter: _cuFilter,page: _page);

        switch(resp.statusCode)
        {
        //
          case 200:
            var d = jsonDecode(resp.body);
            var _respData  =  UserBettingResponceModel.fromJson(d);
            if(_respData.data!=null&&_respData.data!.isNotEmpty)
            {
              _data.addAll(_respData.data??[]);
              _page ++;
            }
            _dData = d;
            break;


          case 500:
            serverErrorWidget(context, resp.body);
            break;

        }


        _loadingMore = false;
        notifyListeners();

      }

  }

  filter(BuildContext context,String? filter)async
  {
    _cuFilter = filter;
    loadBatting(context,refresh: true);
  }

}
