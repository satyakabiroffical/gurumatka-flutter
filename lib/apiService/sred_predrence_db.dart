
import 'dart:convert';
import 'dart:developer';

import 'package:guru_matka_new/models/verifyOTpREsponce.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPref
{

  saveUser(User user) async
  {
    var db = await SharedPreferences.getInstance();
    var _d = jsonEncode(user.toJson());
    db.setString('user', _d);
  }

  Future<User?> getUser() async {
    var db = await SharedPreferences.getInstance();
    var user = await db.getString('user');
    if(user!=null)
      {
        var _d = User.fromJson(jsonDecode(user));
        return _d;
      }
  }

  Future<Map<String,String>?> getHeader() async {
    var db = await SharedPreferences.getInstance();
    var user = await db.getString('user');
    if(user!=null)
      {
        var _d = User.fromJson(jsonDecode(user));
        Map<String,String> head = {
        'Content-Type': 'application/json',
          "Authorization":_d.token??'',
        };
        return head;
      }
  }

  Future<Map<String,String>?> getHeaderSimple() async {
    var db = await SharedPreferences.getInstance();
    var user = await db.getString('user');
    if(user!=null)
    {
      var _d = User.fromJson(jsonDecode(user));
      Map<String,String> head = {
        "Authorization":_d.token??'',
      };
      return head;
    }
  }

  clearDb() async {
    var db = await SharedPreferences.getInstance();
    db.clear();
  }

  Future<bool> isAppFirstStart() async
  {
    var db = await SharedPreferences.getInstance();
    bool firststart  = db.getBool("firstStart")??true;
    if(firststart)
      {
        await db.setBool('firstStart', false);
      }
    return firststart;
  }


  saveNotificationStats(bool s)async
  {
    var db = await SharedPreferences.getInstance();
    db.setBool("notification",s);
  }

  Future<bool?> getNotificationStats() async
  {
    var db = await SharedPreferences.getInstance();
    bool? p = db.getBool("notification");
    return p;
  }

}