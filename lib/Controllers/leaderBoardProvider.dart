
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/models/leader_board_api_responce.dart';

class LeaderBoardProvider with ChangeNotifier
{

  bool _initing = true;
bool _loading = true;
  List<Winners> _winnersLit = [];
  List<String> _filters = ['today','week','month'];
  String _curruntFilter = "today";

bool get loading =>_loading;
List<Winners> get winnersLit =>_winnersLit;
List<String> get  filter =>_filters;
String get curruntFilter =>_curruntFilter;
bool get initInt=>_initing;

  getLeaderBordList(BuildContext context) async
  {
    _loading = true;

    _winnersLit =[];
    var resp = await OtherApi().getLeaderBoardList(type: _curruntFilter);

    switch(resp.statusCode)
        {

          //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = LeaderBoardApiResponce.fromJson(_d);
        if(_data.data?.user!=null&&_data.data!.user!.isNotEmpty)
          {
            _winnersLit = _data.data?.user??[];

          }
        break;

      case 404:
        break;

        //
      case 500:
        serverErrorWidget(context, resp.body);
        break;

      default:
        serverErrorWidget(context, resp.body,title: "Error");
        break;
    }

    _loading  = false;
    _initing = false;
    notifyListeners();
  }


  void filterLister(BuildContext context,String data)async
  {
    _curruntFilter = data;
    notifyListeners();
    getLeaderBordList(context);
  }

}