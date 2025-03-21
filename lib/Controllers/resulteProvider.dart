

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/models/resultResponce%20Model.dart';

import '../component/redirectmehode.dart';
import '../component/serverErrorDailog.dart';
import '../component/shoeMessage.dart';

class ResultProvider with ChangeNotifier
{

 bool  _loading = true;
 List<String> _filters = ["today" , "manual" , "week" , "month"];
 String _crFilter = "today";
 int _page =1;
 DateTime? _startDate ;
 DateTime? _endDate ;
 List<ResultData> _result = [];
 List<ResultData> _todayResult = [];
 int _totlapage = 1;


 bool  get loading =>_loading;
 List<String> get filter =>_filters;
 String get curruntFilter =>_crFilter;
 int get page=>_page;
 DateTime?get startDate => _startDate ;
 DateTime?  get endDate =>_endDate ;
 List<ResultData> get result=> _result;
 List<ResultData> get todayResult=> _todayResult;




 clear()
 {
  _page = 1;
  _crFilter = 'today';
  _result = [];
  _loading = true;
  _totlapage = 1;
  _endDate = null;
  _startDate = null;
 }


 getTodyResult(BuildContext context) async
 {

  var resp =await OtherApi().getResult(
   filter: 'today',
   page: 1,
  );



  switch(resp.statusCode) {
  //
   case 200:
    var date = GameResultResponce.fromJson(jsonDecode(resp.body));
    _todayResult = date.data ?? [];
    _page ++;
    _totlapage = date.page ?? 1;
    notifyListeners();
    break;

  //
   case 400:
    break;

  //
   case 401:
    redirectToLogInPage(context);
    break;

   case 500:
    serverErrorWidget(context, resp.body);
    break;

   default:
    showWarningMessage(context, "Un Expected Error");
    break;
  }

 }


 getResulte(BuildContext context) async
 {


  _loading =true;


  //
  var resp =await OtherApi().getResult(
   filter: _crFilter,
   page: _page,
   startDate: _startDate,
   endDate: _endDate,
  );



  switch(resp.statusCode)
  {

  //
   case 200:
    var date = GameResultResponce.fromJson(jsonDecode(resp.body));
    _result = date.data??[];
    _page ++;
    _totlapage = date.page??1;
    notifyListeners();
    break;

  //
   case 400:
    break;

  //
   case 401:
    redirectToLogInPage(context);
    break;

   case 500:
    serverErrorWidget(context, resp.body);
    break;

   default:
    showWarningMessage(context, "Un Expected Error");
    break;
  }

  _loading = false;
  notifyListeners();
 }


 filterByDateTime(
     BuildContext context,
     {
  required DateTime startDate,
  required DateTime endDate,
})
 {

  clear();
  _crFilter = 'manual';
  _startDate = startDate;
  _endDate = endDate;

  getResulte(context);

 }





 lodeMore(BuildContext context) async
 {

  if(_page<_totlapage)
  {



   //
   var resp =await OtherApi().getResult(
    filter: _crFilter,
    page: _page,
    startDate: _startDate,
    endDate: _endDate,
   );



   switch(resp.statusCode)
   {

   //
    case 200:
     var date = GameResultResponce.fromJson(jsonDecode(resp.body));
     _result.addAll(date.data??[]);
     _page ++;
     notifyListeners();
     break;

   //
    case 400:
     break;

   //
    case 401:
     redirectToLogInPage(context);
     break;

    case 500:
     serverErrorWidget(context, resp.body);
     break;

    default:
     showWarningMessage(context, "Un Expected Error");
     break;
   }

   notifyListeners();
  }

 }




}