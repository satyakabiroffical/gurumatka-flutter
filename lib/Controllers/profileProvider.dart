
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/apiService/LogInAPi.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/models/barcodeResompce.dart';
import 'package:guru_matka_new/models/verifyOTpREsponce.dart';
import 'package:image_picker/image_picker.dart';

import '../component/redirectmehode.dart';

class ProfileProvider with ChangeNotifier
{
  final authApi = AuthApi();
  User? _user;


  String? _selectedImage;
  String? _gender;
  TextEditingController _nameController= TextEditingController();
  TextEditingController _emailController= TextEditingController();
  TextEditingController _addressController= TextEditingController();
  TextEditingController _dobController= TextEditingController();

  TextEditingController get nameController=>_nameController;
  TextEditingController get emailController=>_emailController;
  TextEditingController get addressController=>_addressController;
  TextEditingController get dobController=>_dobController;
  String? get gender =>_gender;
  String? get selectedImage =>_selectedImage;

  User? get user => _user;



  getUser(BuildContext context) async
  {
    var resp = await authApi.getUserProfile();
    log("responce from get profile api \n${resp.statusCode}\n${resp.body}");
    switch(resp.statusCode)
        {

          //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = User.fromJson(_d['data']);
        _user = _data;
        UserPref().saveUser(_user!);
        notifyListeners();
        break;

      case 401:
        redirectToLogInPage(context);
        break;

        //
      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

        //
      case 400:
        break;
    }
  }


  convertCommission(BuildContext context) async
  {
    var resp = await OtherApi().exchangeCommission();

    switch(resp.statusCode)
        {
          //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = User.fromJson(_d["data"]);
        await updateUserData(_data);
        break;

      case 401:
        redirectToLogInPage(context);
        break;

        //
      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

        //
      default:
        break;

    }
  }



  selectProfileImage(BuildContext context)async
  {
    var picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image!=null)
      {
        _selectedImage= image.path;
        notifyListeners();
      }
  }


  setGender(String? g)async
  {
    _gender = g;
    notifyListeners();
  }



  selectDOB(BuildContext context) async
  {

   var d=  await showDatePicker(
    context: context,
    currentDate: DateTime.now(),
    firstDate: DateTime(1000),
    lastDate: DateTime(5000)
    );

   if(d!=null)
     {
       _dobController.text = formatDate(d);
     }
  }


  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }


  initUpdate()
  {
    _nameController.text = _user?.userName??'';
    _emailController.text = _user?.email??'';
    dobController.text = _user?.dob??'';
    _addressController.text = _user?.address??'';
    _gender = user?.gender??'';
  }


  clearUpdate()
  {
    _nameController.clear();
    _addressController.clear();
    dobController.clear();
    _selectedImage = null;
    _gender = null;
  }


  updateUserData(User user)async
  {
    _user = user;
    await UserPref().saveUser(user);
    notifyListeners();
  }


  updateProfile(BuildContext context)async
  {


    if(selectedImage!=null)
    {
     var _resp = await authApi.updateUserProfilePicture(selectedImage??'');
     var s =  await _resp.stream.bytesToString();
     log("responce from profile image update api \n${_resp.statusCode}\n${s}");
    }


    var resp  = await authApi.updateUser(
      name: _nameController.text.trim().isNotEmpty?_nameController.text.trim():_user?.userName??'',
      email: _emailController.text.trim().isNotEmpty?_emailController.text.trim():_user?.email??'',
      address: _addressController.text.trim().isNotEmpty?_addressController.text.trim():_user?.address??'',
      gender: _gender!=null?_gender:_user?.gender??'',
      dob: _dobController.text.trim().isNotEmpty?_dobController.text.trim():_user?.dob??'',
    );



    log("responce from update profile api \n${resp.statusCode}\n${resp.body}");
    switch(resp.statusCode)
    {

    //
      case 200:
        var _d = jsonDecode(resp.body);
        var _data = User.fromJson(_d['data']);
        updateUserData(_data);
        clearUpdate();
        Navigator.pop(context);
        break;

        //
      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

      case 401:
        redirectToLogInPage(context);
        break;

    //
      case 400:
        break;
    }

  }
}