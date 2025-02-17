

import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:guru_matka_new/apiService/transectionApi.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/models/transectionhistory%20responce.dart';
import 'package:image_picker/image_picker.dart';

class TransectionProvider with ChangeNotifier
{
  final _transectionApi = TransactionApi();

  bool _loading = true;
  List<Transaction> _transactions = [];
  List<Transaction> _filterTransactions = [];
  List<String> _tStatuse = ["All","Approved","Rejected","Pending"];
  String _filter ='All';
  int _page = 1;


  //
  String? _screenShot;
  TextEditingController _ammuntController =TextEditingController();
  TextEditingController _tIdController =TextEditingController();

  String? get  screenShot =>_screenShot;
  TextEditingController  get ammuntController =>_ammuntController;
  TextEditingController  get tIdController => _tIdController;



  bool get loading =>_loading;
  List<Transaction> get transactions =>_transactions;
  List<Transaction> get filterTransactions =>_filterTransactions;
  List<String> get tStatus => _tStatuse;
  String get curruntFilter =>_filter;






  //
  getTransection() async
  {

    _loading = true;
    _page= 1;
    var resp = await _transectionApi.transactionHistory();

    switch(resp.statusCode)
    {
      //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = TransectionHistoryResponce.fromJson(_d);
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
      var resp = await _transectionApi.transactionHistory(page: _page);

      switch(resp.statusCode)
      {
      //
        case 200:
          var _d = jsonDecode(resp.body);
          var _data = TransectionHistoryResponce.fromJson(_d);
          if(_data.data!=null&&_data.data!.isNotEmpty)
          {
            _transactions.addAll(_data.data??[]) ;
            _filterTransactions = [];
            _transactions.forEach((element) {
              if(element.status==_filter||_filter=="All")
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


  clearFields()
  {
    _tIdController.clear();
    _ammuntController.clear();
    _screenShot = null;
  }


  selectScreeShot(BuildContext context) async
  {
    var picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null)
    {
      _screenShot= image.path;
      notifyListeners();
    }
  }

  //
  addAmmount(BuildContext context) async
  {
    print("AaaAmount");
    var resp = await _transectionApi.addAmmountInWalletRequest(
      amount: _ammuntController.text.trim(),
      transactionId: _tIdController.text.trim(),
      ss: _screenShot
    );

    switch(resp.statusCode)
        {
      case 200:
        var _d = await resp.stream.bytesToString();
        var _d2= jsonDecode(_d);

        Navigator.pop(context);

        showMessage(context, "Amount added Successful");

        notifyListeners();

        break;
    }

  }

  //
clear() async
{
 _page =1;
 _transactions = [];
 _filter = "All";
 _filterTransactions = [];
 _loading = true;

}


}