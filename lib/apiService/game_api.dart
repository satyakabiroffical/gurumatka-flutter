
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
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
  Future<http.Response>crateGame() async
  {

    var user = UserPref().getUser();
    String uri = '${MyUrl.base}${MyUrl.createGame}';
    var _data = {
      "userId": "67af24f9a0865c4945266a9a",
      // Choose anyone Type  - JODI, HARUF, CROSSING
      "gameType": "CROSSING",
      "battingGameID":"67b31e8cf1109eb51fba1a8e",
      // change this below field if you would choose another type of game
      "Crossing": [
        {
          "crossingNum": 2,
          "crossingAmount": 500
        },
        {
          "crossingNum": 5,
          "crossingAmount": 200
        }
      ],
      "CrossingTotalAmount": {
        "totalAmount": 700
      }
    };

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


  Future<http.Response>getAllGames() async
  {

    String uri = '${MyUrl.base}${MyUrl.getAllGame}?disable=false';

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