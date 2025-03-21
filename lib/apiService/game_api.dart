
import 'dart:convert';
import 'dart:developer';
import 'package:guru_matka_new/models/joidiModel.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'api_path.dart';
import 'sred_predrence_db.dart';


class GamesAPi
{

  Future<http.Response>usrGetGameBet() async
  {

    String uri = '${MyUrl.base}${MyUrl.userGetGameBet}';

    var toke = await UserPref().getHeader();

    //
    var resp = await http.get(
      Uri.parse(uri),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }






  //
  Future<http.Response>userUpdateGameBet({
  int? jodiAmount= 100,
  int? crossingAmount= 100,
  int? harufAmount= 100,
  int? jodiPercent= 0,
  int? crossingPercent= 6,
  int? harufPercent= 7
}) async
  {

    String uri = '${MyUrl.base}${MyUrl.usersUpdateGameBet}';
    var _data = {
      "jodiAmount": jodiAmount,
      "crossingAmount": crossingAmount ,
      "harufAmount": harufAmount ,
      "jodiPercent": jodiPercent,
      "crossingPercent": crossingPercent ,
      "harufPercent": harufPercent
    };

    var toke = await UserPref().getHeader();

    //
    var resp = await http.put(
      Uri.parse(uri),
      body: jsonEncode(_data),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }

  //
  Future<http.Response>crateGameForJodi({
    required List<JodiModel>? jodiList,
    required int totalAmount,
    required String gameId,
}) async
  {

    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.createGame}';


    var _data = {
      "userId": user?.id??'',
      // Choose anyone Type  - JODI, HARUF, CROSSING
      "gameType": "JODI",
      "battingGameID":gameId,
      // change this below field if you would choose another type of game
      "jodi":jodiList?.map((e) =>e.toJson(),).toList()??[],
      "jodiTotalAmount": totalAmount

    };

    Logger().t(_data);

    var toke = await UserPref().getHeader();

    //
    var resp = await http.post(
      Uri.parse(uri),
      body: jsonEncode(_data),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }



  //

  Future<http.Response>crateGameForHaruf({
    required Map<String,String?> harufData,
    required int totalAmount,
    required String gameId,
  }) async
  {

    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.createGame}';


    Map<String,List<Map>> _selectio ={

      "andarGame":[],
      'baharGame':[],

    };

    harufData.forEach((key, value) {

      //
      if(key.startsWith("A")&&value!=null)
        {
          _selectio['andarGame']!.add({
            "game":key,
            "harufAmount":int.parse((value.isEmpty?'0':value))
          });
        }
      else if(key.startsWith("B")&&value!=null)
        {

          _selectio['baharGame']!.add({
            "game":key,
            "harufAmount":int.parse((value.isEmpty?'0':value))
          });

        }

      //


    },);


    var _data = {
      "userId": user?.id??'',
      // Choose anyone Type  - JODI, HARUF, CROSSING
      "gameType": "HARUF",
      "battingGameID":gameId,
      'haruf':[_selectio],
      // change this below field if you would choose another type of game
      "harufTotalAmount": totalAmount
    };


    Logger().t(_data);

    var toke = await UserPref().getHeader();

    //
    var resp = await http.post(
      Uri.parse(uri),
      body: jsonEncode(_data),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }

  //
  Future<http.Response>crateGameForCrossing({
    required List<int>? crossingNumberList,
    required int amount,
    required int totalAmount,
    required String gameId,
  }) async
  {

    var user =  await UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.createGame}';


    var _data = {
      "userId": user?.id??'',
      // Choose anyone Type  - JODI, HARUF, CROSSING
      "gameType": "CROSSING",
      "battingGameID":gameId,
      // change this below field if you would choose another type of game
      "Crossing":crossingNumberList?.map((e) =>{
        "crossingNum":e,
        'crossingAmount':amount
      },).toList()??[],
      "CrossingTotalAmount": totalAmount
    };




    Logger().t(_data);

    var toke = await UserPref().getHeader();

    //
    var resp = await http.post(
      Uri.parse(uri),
      body: jsonEncode(_data),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }


  //
  Future<http.Response>getGameById(String gameId) async
  {

    String uri = '${MyUrl.base}${MyUrl.getGameByGameId}?gameId=$gameId';

    var toke = await UserPref().getHeader();

    //
    var resp = await http.get(
      Uri.parse(uri),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }



  //Not Used
  Future<http.Response>getGameListByType(String gameType) async
  {

    String uri = '${MyUrl.base}${MyUrl.getAllGameListByType}?gameType=HARUF';

    var toke = await UserPref().getHeader();

    //
    var resp = await http.get(
      Uri.parse(uri),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }


  //Not Used
  Future<http.Response>getAllGames() async
  {

    String uri = '${MyUrl.base}${MyUrl.getAllGame}';

    var toke = await UserPref().getHeader();

    //
    var resp = await http.get(
      Uri.parse(uri),
      headers: toke,
    );

    //
    log('$uri\n${resp.statusCode}\n${resp.body}');
    return resp;
  }



}