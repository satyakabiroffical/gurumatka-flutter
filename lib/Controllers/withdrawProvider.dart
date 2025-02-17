

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/transectionApi.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/models/transectionhistory%20responce.dart';
import 'package:guru_matka_new/models/withdrawHistoryModel.dart';

class WithdrawProvider with ChangeNotifier
{
  final _transectionApi = TransactionApi();

  bool _loading = true;
  List<WithdrawData> _transactions = [];
  List<WithdrawData> _filterTransactions = [];
  List<String> _tStatuse = ["All","Approved","Rejected","Pending"];
  String _filter ='All';
  int _page = 1;

  //
  TextEditingController _ammountController = TextEditingController();
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _accountNumberController = TextEditingController();
  TextEditingController _holderNameController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _ifscCodeController = TextEditingController();


  //
  TextEditingController get ammountController => _ammountController;
  TextEditingController get bankNameController => _bankNameController;
  TextEditingController get accountNumberController => _accountNumberController;
  TextEditingController get holderNameController => _holderNameController;
  TextEditingController get mobileNumberController => _mobileNumberController;
  TextEditingController get ifscCodeController => _ifscCodeController;


  //
  bool get loading =>_loading;
  List<WithdrawData> get transactions =>_transactions;
  List<WithdrawData> get filterTransactions =>_filterTransactions;
  List<String> get tStatus => _tStatuse;
  String get curruntFilter =>_filter;




  //
  getTransection() async
  {

    _loading = true;
    _page= 1;
    var resp = await _transectionApi.withdrawHistory();

    switch(resp.statusCode)
    {
    //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = WithdrawHistoryResponce.fromJson(_d);
        if(_data.data!=null&&_data.data!.isNotEmpty)
        {
          _transactions = _data.data??[];
          _transactions.forEach((element) {
            _filterTransactions = _transactions;
          },);
          _page++;
        }
        break;

    //
      default :
        break;
    }

    _loading = false;
    notifyListeners();
  }

  loadMore() async
  {

    notifyListeners();
    var resp = await _transectionApi.withdrawHistory(page: _page);

    switch(resp.statusCode)
    {
    //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = WithdrawHistoryResponce.fromJson(_d);
        if(_data.data!=null&&_data.data!.isNotEmpty)
        {
          _transactions.addAll(_data.data??[]) ;
          _filterTransactions = [];
          _transactions.forEach((element) {
            if(element.status==_filter||_filter=='All')
            {
              _filterTransactions.add(element);
            }
          },);
          _page++;
        }
        break;

    //
      default :
        break;
    }


    notifyListeners();

  }

  //
  filter(String status) async
  {
    _filter = status;
    print(status);
    _filterTransactions = [];
    if(status =='All')
    {
      _filterTransactions =_transactions;
    }
    else
    {
      _transactions.forEach((e) {
        if(e.status==status)
        {
          _filterTransactions.add(e);
        }
      },);
    }
    notifyListeners();
  }

  clearTextControllers()
  {
     _ammountController.clear();
     _holderNameController.clear();
     _bankNameController.clear();
     _ifscCodeController.clear();
     _mobileNumberController.clear();
     _accountNumberController.clear();
  }


  //
  createWithdraw(BuildContext context) async
  {
    print("ajsdfhj");
    var resp =  await _transectionApi.createWithdrawRequest(
      amount: _ammountController.text.trim(),
      accountHolderName: _holderNameController.text.trim(),
      bankName: _bankNameController.text.trim(),
      ifscCode: _ifscCodeController.text.trim(),
      mobileNumber: _mobileNumberController.text.trim(),
      accountNumber: _accountNumberController.text.trim(),
    );

    switch(resp.statusCode)
        {

          //
      case 201:
        var _d = jsonDecode(resp.body);
        var _data = WithdrawData.fromJson(_d['data']);
        _transactions.add(_data);
        if(_filter=="All"||_filter==_data.status);
        {
          _filterTransactions.add(_data);
        }
        showMessage(context, "Withdraw request has sent",warning: false);
        Navigator.pop(context);
          clearTextControllers();

        break;
    }
  }

  //
  clear() async
  {
    _page =1;
    _transactions = [];

  }


}