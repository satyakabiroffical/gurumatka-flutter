


import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/apiService/LogInAPi.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/customFormater.dart';
import 'package:guru_matka_new/component/redirectmehode.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/app_info_responce.dart';
import 'package:guru_matka_new/models/get_conpany_model.dart';
import 'package:guru_matka_new/models/verifyOTpREsponce.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/push_notification/notification%20service.dart';
import 'package:guru_matka_new/screens/daboard/home/homeScreen.dart';
import 'package:guru_matka_new/screens/daboard/navigation%20screens.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/Otp.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/login.dart';
import 'package:provider/provider.dart';

class AuthProvider with ChangeNotifier
{
  final _auth = AuthApi();
  bool _sending = false;
  GetConpenyResponce? _company;
  bool _warnningEnable = true;
  TextEditingController _numberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _refCodeController = TextEditingController();


  TextEditingController get numberController =>_numberController;
  TextEditingController get otpController =>_otpController;
  TextEditingController get refCodeController =>_refCodeController;
  bool get sending => _sending;
  GetConpenyResponce? get company =>_company;



  Future<bool> isLoggedIn() async
  {
    var _d =  await UserPref().getUser();
    return _d!=null;
  }



  sentOtp(BuildContext context) async
  {
    log('${_numberController.text}');
    if(_numberController.text.trim().length==10)
      {
        print("Sendding otp ");
        var resp = await _auth.sendOtpToMobileNumber(_numberController.text.trim());
        log('Rsponce from send otp api ${resp.statusCode}\n${resp.body}');
        switch(resp.statusCode)
            {

          case 201:
            print("navigation to otp Screen");
            RouteTo(context, child: (p0, p1) => OtpScreen(animation: p0),);
            break;


          case 500:
            serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
            break;

          case 401:
            redirectToLogInPage(context);
            break;


          default :
            log('${resp.statusCode}\n${resp.body}');
            break;
        }

      }
  }


  verifyOtp(BuildContext context) async
  {
    if(_otpController.text.length==4)
      {
        print("Now otp verifyng ");
        String? tocken;


        if(await NotificationService().getPermission())
          {
            tocken = await NotificationService().getDeviceToken();
          }

        print("Tocken ${tocken}");


        var resp =  await _auth.verifyOtp(_numberController.text.trim(), _otpController.text.trim(),
        fcmToken: tocken,
        refCode: (_refCodeController.text.isNotEmpty)?_refCodeController.text:null
        );

        print("Otp hansend");

        log('responce from otp verfy api ${resp.statusCode} ${resp.body}');

        switch(resp.statusCode)
        {
          case 200:
            print("decoding bosd");
            var d = jsonDecode(resp.body);
            print("crating model");
            var _data = OtpVerifyResponce.fromJson(d);
            print("getting saving User");
             await UserPref().saveUser(_data.data!.user!);
            print("runnig use get api");
             await Provider.of<ProfileProvider>(context,listen: false).getUser(context);
             _numberController.clear();
             _otpController.clear();
            print("controller is clen now navigation to home screen");
            ReplaceAll(context, child: (p0, p1) => NavigationScreen());
            break;

          case 400:
            var _d = jsonDecode(resp.body);
            showWarningMessage(context,'${_d['message']}');
            break;

          case 401:
            redirectToLogInPage(context);
            break;


            //
          case 500:
            serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
            break;


            //
          default :
            log('${resp.statusCode}\n${resp.body}');
            break;
        }


      }
  }


  //
showMessage(BuildContext context) async
{
  if(_warnningEnable)
    {


      var resp = await _auth.getUserAppInfo();
      var resp2 = await _auth.getCompany();

      log("responce from app Info api \n${resp.statusCode}\n${resp.body}");
      log("responce from get Company api \n${resp2.statusCode}\n${resp2.body}");

      switch(resp.statusCode)
      {
        case 200:

          var _d = jsonDecode(resp.body);
          var _data = AppInfoResponce.fromJson(_d);

          var _d2 = jsonDecode(resp2.body);
          _company = GetConpenyResponce.fromJson(_d2);

          await showDialog(
            context: context,
            barrierDismissible: false, // Prevent closing by tapping outside
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => false, // Disable back button closing
                child: Center(
                  child: Container(

                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.symmetric(vertical: 10),

                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)

                    ),


                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        
                        //
                        Center(
                            child: Text(
                                '${CustomFormat().getDayTime()} ${Provider.of<ProfileProvider>(context,listen: false).user?.userName??''}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: SC.from_width(16),
                                ))),
                        SizedBox(height: SC.from_width(10),),
                        
                        //

                        Container(
                          color: Colors.grey.shade900,
                          padding: EdgeInsets.all(10),
                          height: SC.from_width(300),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                            
                              children: [
                            
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child:Text('${_data.data?.title}', style: TextStyle(fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(height: SC.from_width(10),),
                            
                            
                                //
                                HtmlWidget(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(14),
                                  ),
                                  "${_data.data?.description}",
                                ),
                                SizedBox(height:SC.from_width(15)),
                            
                                //
                                Text("हेल्पलाइन : ${_data.data?.contactNumber}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(14),
                                  ),),
                            
                            
                                //
                                Text("व्हाट्सऐप : ${_data.data?.whatsaapContact}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(14),
                                  ),),
                                SizedBox(height:SC.from_width(15)),
                            
                            
                                //
                                Text("डाउनलोड करे:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(14),
                                  ),),
                            
                            
                                Text("${_data.data?.downloadLink}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(14),
                                  ),),
                                SizedBox(height: SC.from_width(15),),
                            
                              ],
                            ),
                          ),),
                        SizedBox(height: SC.from_width(10),),



                        //
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: CustomButton(
                            onTap: () {
                              _warnningEnable =false;
                              Navigator.of(context).pop(); // Close dialog
                            },
                            title: "Close",
                          ),
                        ),
                        SizedBox(height: SC.from_width(15),),

                        Text("Feel free to reach us if you have any query ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SC.from_width(13)
                          ),),
                        SizedBox(height: SC.from_width(7),),

                        //
                        Text("Customer Care:${_company?.data?.contactNumber??''}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SC.from_width(13),
                              color: AppConstant.themYellow
                          ),),
                        SizedBox(height: SC.from_width(7),),

                        //
                        Text("Whatsapp:${_company?.data?.contactNumber??''}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SC.from_width(13),
                              color: AppConstant.themYellow
                          ),),
                        SizedBox(height: SC.from_width(7),),

                      ],
                    ),

                  ),
                ),
              );
            },
          );
          break;


        case 401:
          redirectToLogInPage(context);
          break;


        case 500:
          serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
          break;
      }





    }
}


//
logOut(BuildContext context)async
{
  var resp = await _auth.logOut();

  switch(resp.statusCode)
      {
        //
    case 200:
      UserPref().clearDb();
      ReplaceAll(context, child: (p0, p1) => LoginScreen(animation: p0),);
      break;


    case 401:
      redirectToLogInPage(context);
      break;

      //
    default:
      break;
  }
}

}