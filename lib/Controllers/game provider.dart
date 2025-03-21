
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/apiService/game_api.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/jodi_widget.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/gameInfo.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:guru_matka_new/models/joidiModel.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:provider/provider.dart';

import '../component/redirectmehode.dart';

class GameProvider with ChangeNotifier
{

  List<JodiModel> _selectedJodi =[];
  List<int> _crossingResult =[];
  TextEditingController _crossingValue = TextEditingController();
  TextEditingController _crossingAmount = TextEditingController();
  bool _jodiCut = false;
  Map<String,String> _harufData ={};
  GameInfo? _gameInfo;



  List<JodiModel>  get selectedJodi =>_selectedJodi;
  List<int> get crossingResult =>_crossingResult;
  TextEditingController get crossingValue => _crossingValue;
  TextEditingController  get crossingAmount =>_crossingAmount;
  bool get jodiCut => _jodiCut;
  Map<String,String> get harufData => _harufData;
  GameInfo? get gameInfo=> _gameInfo;




  clear()
  {
    _selectedJodi =[];
    _harufData = {};
    _crossingResult =[];
    _jodiCut = false;
    _crossingValue.clear();
    _crossingAmount.clear();
    _gameInfo = null;

  }


  update()
  {
    notifyListeners();
  }


  getUserBettingAmount(BuildContext context) async
  {
    var resp = await GamesAPi().usrGetGameBet();

    switch(resp.statusCode)
    {

    //
      case 200:
        var _d = jsonDecode(resp.body);
        _gameInfo = GameInfo.fromJson(_d['data']);
        notifyListeners();
        break;

    //
      case 400:
        break;

    //
      case 401:
        showWarningMessage(context, "Token Expire");
        break;

      case 500:
        serverErrorWidget(context, resp.body);
        break;

      default:
        showWarningMessage(context, "Un Expected Error");
        break;
    }
  }


  addHarufData(String key,String value)async
  {
    _harufData[key] =value;
  }



  int getHarufTotle()
  {
    int _total = 0;
    _harufData.forEach((key, value) {
      log("for ${key} =  $value ${value.isEmpty}");
      if(value.isNotEmpty)
      {
        int v = int.parse(value);
        _total = _total + v;
        log("for ${key} =  $value  Done ");
      }
    },);

    return _total;
  }

  bool isCrossingValueValid(String numberStr) {
    // Create a set to store seen digits
    Set<String> seenDigits = {};

    // Iterate through each character in the string
    for (int i = 0; i < numberStr.length; i++) {
      String char = numberStr[i];

      // Check if the character is a digit
      if (char.contains(RegExp(r'[0-9]'))) {
        // If the digit is already in the set, it's repeating
        if (seenDigits.contains(char)) {
          return true;
        }
        // Otherwise, add it to the set
        seenDigits.add(char);
      }
    }

    // If no repeating digits are found, return false
    return false;
  }



  //
  selectNumber(BuildContext context,int num) async
  {

    TextEditingController _c= TextEditingController();
    _c.text='0';
    var _selectAlt = false;
    var key = GlobalKey<FormState>();


     bool? prosid = await OpenDailovgWithAnimation(context,
        barriarDissmesible: false,
        dailog: WillPopScope(
          onWillPop: ()async{
            return false;
          },
          child: Center(
            child: Card(
              color:Colors.transparent,
              elevation: 0,
              child: Container(

                decoration: AppConstant.greyBoxDecoration,

                    margin: EdgeInsets.all(25),

                    padding: EdgeInsets.all(10),

                    child: Consumer<GameProvider>(
              builder: (context, p, child) => Form(
                key: key,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                        child: InkWell(onTap: (){
                          Navigator.pop(context);
                        }, child: Icon(Icons.close))),
                    SizedBox(height: SC.from_width(10),),

                  //
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        border: Border.all(
                          color: Colors.black
                        ),

                        //
                        gradient: LinearGradient(colors: [
                          Colors.grey.shade900,
                          Color.fromRGBO(19, 19, 22, 1)
                        ]),

                            //
                      ),
                      height: SC.from_width(60),
                      width: SC.from_width(60),
                      child: Center(
                        child: Text("${num}",style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(30)
                        ),),

                      )),
                  SizedBox(height: SC.from_width(10),),

                  //
                  Text("Place Amount On Selected Number",style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),),
                    SizedBox(height: SC.from_width(10),),

                  TextFormField(
                    controller: _c,
                    onChanged: (d)
                    {
                      _c.text = int.parse(d).toString();
                    },
                    keyboardType: TextInputType.number,


                    validator: (a){
                      if(a!.isEmpty)
                        {
                          return 'Enter Amount';
                        }
                      else if(int.parse(a.toString())<=0)
                          {
                            return 'Amount Must Be Greater Then 0';
                          }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    decoration: InputDecoration(

                      //
                        prefixIcon: SizedBox(
                          width: SC.from_width(40),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Center(child: Text('₹')),
                          ),),


                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white
                            )
                        ),

                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.red
                          )
                      )
                    ),
                  ),
                    SizedBox(height: SC.from_width(10),),

                  //
                  if(hasAlternate(num))
                  Row(children: [
                    Text("Palti (Reverse Bet)"),
                    Spacer(),
                    Switch(value: _selectAlt, onChanged: (d){
                      _selectAlt =d;
                      notifyListeners();
                    })
                  ],),
                    SizedBox(height: SC.from_width(10),),


                  CustomButton(
                    onTap: (){
                      if(key.currentState!.validate())
                        {
                          Navigator.pop(context,true);
                        }
                    },
                      title: "Save"
                  )


                ],),
              ) ,

                    ),
                  ),
            ),
          ),
        ));
     
     if(prosid==true)
       {


         _selectedJodi.add(JodiModel(number: num, amount: int.parse(_c.text)));
         if(_selectAlt)
           {
             var alt =  num.toString().split('').reversed.join();
             _selectedJodi.add(JodiModel(number: int.parse(alt), amount: int.parse(_c.text)));
           }
         
         
       }

  }

  switchJodi()
  {
    _jodiCut = !_jodiCut;


  }



  bool isNumberIsSelected(int num)
  {

    bool b = false;
    _selectedJodi.forEach((element) {
      if(element.number==num)
        {
          b = true;
        }
    },
    );

   return b;
  }



  removeNumber(int num)
  {
    _selectedJodi.removeWhere((e)=>e.number==num);
    notifyListeners();
  }

  JodiModel? getJodi(int num)
  {
    JodiModel? j;
    _selectedJodi.forEach((element) {
      if(element.number==num)
        {
          j=element;
        }
    },);
    return j;
  }


  int totalAmount()
  {
    int _total  = 0;
    _selectedJodi.forEach((element) {
      _total = _total+element.amount;
    },);

    return _total;
  }


  clearJodiGame()
  {
    _selectedJodi =[];
  }




  List<int> crossingGameResult() {
    // Convert the number to a string to easily access individual digits
    String numStr = _crossingValue.text.toString();

    // Initialize an empty list to store the two-digit numbers
    List<int> twoDigitNumbers = [];

    // Iterate through each digit as the first digit of the two-digit number
    for (int i = 0; i < numStr.length; i++) {
      // Iterate through each digit as the second digit of the two-digit number
      for (int j = 0; j < numStr.length; j++) {
        // Ensure that the same digit is not used twice unless it appears multiple times
        if(_jodiCut)
          {
            if (i != j) {
              // Combine the two digits to form a two-digit number
              String twoDigitStr = numStr[i] + numStr[j];
              // Convert the string to an integer and add it to the list
              twoDigitNumbers.add(int.parse(twoDigitStr));
            }
          }
        else
          {
            String twoDigitStr = numStr[i] + numStr[j];
            // Convert the string to an integer and add it to the list
            twoDigitNumbers.add(int.parse(twoDigitStr));
        }
      }
    }

    _crossingResult = twoDigitNumbers;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();  // Ensures UI updates after the build phase is complete
    });
    // Return the list of two-digit numbers
    return twoDigitNumbers;
  }





  bool hasAlternate(int num)
  {
    if(num<10)
      {
        return false;
      }
    else
      {
        var alt =  num.toString().split('').reversed.join();
        if(alt==num.toString())
          {
            return false;
          }
        else
          {
            return true;
          }
      }

  }



  submitJodiBet(BuildContext context,String gameId) async
  {


    var crTotla = totalAmount();
    if(crTotla>=(_gameInfo?.minAmount??0)&&crTotla<=(_gameInfo?.maxAmount??0))
      {
        var resp =  await GamesAPi().crateGameForJodi(jodiList: _selectedJodi, totalAmount: totalAmount(), gameId: gameId);

        switch(resp.statusCode)
        {

        //
          case 201:
            showWarningMessage(context, "Betting Submit",warning: false);
            _selectedJodi = [];
            Provider.of<ProfileProvider>(context,listen: false).getUser(context);
            notifyListeners();
            break;

        //
          case 400:
            showWarningMessage(context,'${jsonDecode(resp.body)['message']}');
            break;

        //
          case 401:
            showWarningMessage(context, "Token Expire");
            break;

          case 500:
            serverErrorWidget(context, resp.body);
            break;

          default:
            showWarningMessage(context, "Un Expected Error");
            break;
        }
      }
    else
      {
        showWarningMessage(context, "Total Betting Amount Must Be In Range Of ${_gameInfo?.minAmount} - ${_gameInfo?.maxAmount}");
      }

  }


  submitCrossingBet(BuildContext context,String gameId) async
  {

    var crTotla =  int.parse(_crossingAmount.text.isNotEmpty?_crossingAmount.text:'0')*_crossingResult.length;


    if(crTotla>=(_gameInfo?.minAmount??0)&&crTotla<=(_gameInfo?.maxAmount??0))
      {
        var resp =  await GamesAPi().crateGameForCrossing(
            crossingNumberList: _crossingResult,
            amount: int.parse(_crossingAmount.text.isNotEmpty?_crossingAmount.text:'0'),
            totalAmount: (int.parse(_crossingAmount.text.isNotEmpty?_crossingAmount.text:'0')*_crossingResult.length).toInt(),
            gameId: gameId);

        switch(resp.statusCode)
        {

        //
          case 201:
            showWarningMessage(context, "Betting Submit",warning: false);
            _crossingAmount.clear();
            _crossingValue.clear();
            _crossingResult =[];
            _jodiCut =false;
            Provider.of<ProfileProvider>(context,listen: false).getUser(context);
            notifyListeners();
            break;

        //
          case 400:
            showWarningMessage(context,'${jsonDecode(resp.body)['message']}');
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
    else
      {
        showWarningMessage(context, "Total Betting Amount Must Be In Range Of ${_gameInfo?.minAmount} - ${_gameInfo?.maxAmount}");
      }


  }



  submitHarufBet(BuildContext context,String gameId) async
  {

    var crTotla =  getHarufTotle();
    var user = Provider.of<ProfileProvider>(context,listen: false).user;

    if(crTotla>=(_gameInfo?.minAmount??0)&&crTotla<=(_gameInfo?.maxAmount??0) )
      {

        var resp =  await GamesAPi().crateGameForHaruf(
            harufData: _harufData,
            totalAmount:getHarufTotle(),
            gameId: gameId);

        switch(resp.statusCode)
        {

        //
          case 201:
            showWarningMessage(context, "Betting Submit",warning: false);
            _harufData  ={};
            Provider.of<ProfileProvider>(context,listen: false).getUser(context);
            notifyListeners();
            break;

        //
          case 400:
            showWarningMessage(context,'${jsonDecode(resp.body)['message']}');
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
    else
      {
        showWarningMessage(context, "Total Betting Amount Must Be In Range Of ${_gameInfo?.minAmount} - ${_gameInfo?.maxAmount}");


      }


  }





}



