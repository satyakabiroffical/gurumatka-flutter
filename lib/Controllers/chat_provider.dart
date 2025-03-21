 import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/component/redirectmehode.dart';
import 'package:guru_matka_new/component/serverErrorDailog.dart';
import 'package:guru_matka_new/models/chat_resp.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:guru_matka_new/models/thread_data.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketProvider with ChangeNotifier
{

  WebSocketChannel? _channel;
  bool _connectScocket = true;
  final _otherAPi = OtherApi();
  ThreadData? _threadId;
  int _totlepage = 0;
  bool _loadingMoreChat = false;
  int _page = 1;
  bool _loading = true;
  TextEditingController _messageController =TextEditingController();
  List<Game> _openGames = [];
  List<Game> _notOpenGames = [];

  List<Message> _message = [];
  ThreadData? get threadId =>_threadId;
  List<Message> get message => _message;
  TextEditingController get messageController =>_messageController;
  bool get loading => _loading;
  List<Game>get  openGames => _openGames ;
  List<Game> get notOpenGames =>_notOpenGames;
  bool get loadingMoreChat =>_loadingMoreChat;




  initChannel(
  {
    void Function(String)? onEvent,
}
      )async
  {


    String socketChannel = "ws://api.gurumatka.in:1111/ws";
    if(_connectScocket)
    {


      print("connctin wb socket");
      final uri = Uri.parse(socketChannel);
      _channel = WebSocketChannel.connect(uri);


      await _channel?.ready;
      print("connctin redy");
      _connectScocket = false;

      _channel?.stream.listen((event)async{





        // print();

        Logger().i("Listing for channel \nEvent :- \n${jsonDecode(event)}");

        if(onEvent!=null)
        {
          onEvent(event);
        }

        handelEvent(event);

      },


          onError: (e){

        print("Error from socket done \n $e");

          },




          onDone: (){
        _connectScocket =true;

            print("Socket Colose");
          });



    }
  }

  lodeChats(BuildContext context) async
  {
    _loading = true;
    var resp = await _otherAPi.getThreadId();
    _message = [];
    _threadId = null;
    _page =1;
    switch(resp.statusCode)
        {
      case 201:
        var _d = jsonDecode(resp.body);
        var _data = TreadDataResponce.fromJson(_d);

        _threadId = _data.data;
        break;


      case 401:
        redirectToLogInPage(context);
        break;

      case 500:
        serverErrorWidget(context, resp.body,title: kDebugMode?"Frome get Home APi":null);
        break;

      default:
        print("Responce from get thred api ${resp.statusCode} \n ${resp.body}");
        break;
    }

    if(threadId!=null)
      {
        var resp2 = await _otherAPi.getChat(threadId?.id??'');
        switch(resp2.statusCode)
            {

              //
          case 200:
            var _d = jsonDecode(resp2.body);
            print('this is data ${_d}');
            var _data = ChatResponce.fromJson(_d);
            if(_data.data!=null&&_data.data!.isNotEmpty)
              {
                _message = _data.data??[];
                _totlepage = _data.page??0;
                _page++;
              }
            break;

            //
          case 500:
            serverErrorWidget(context, resp2.body,title: kDebugMode?"Frome get Home APi":null);
            break;

            //
          default :
            print("Responce from get chat api ${resp2.statusCode} \n ${resp2.body}");
            break;
        }

      }

    _loading = false;
    notifyListeners();

  }


  sendMessage(BuildContext context,ScrollController sc)
  {
    var m  = {
      "threadId":_threadId?.id??'', // Replace with actual thread ID
      "message":_messageController.text.trim(),
      "type": "USER",
      'userId':Provider.of<ProfileProvider>(context,listen: false).user?.id,
      'adminId':_threadId?.adminId??'',
    };
    print(m);
    if(_channel!=null)
      {
        _channel!.sink.add(jsonEncode(m));
      }
    _messageController.clear();
    notifyListeners();
  }





  loadMoreChat(BuildContext context) async
  {

   if(_page<_totlepage)
     {
       _loadingMoreChat = true;
       notifyListeners();
       var resp2 = await _otherAPi.getChat(threadId?.id??'',page: _page);
       switch(resp2.statusCode)
       {

       //
         case 200:
           var _d = jsonDecode(resp2.body);
           print('this is data ${_d}');
           var _data = ChatResponce.fromJson(_d);
           if(_data.data!.isNotEmpty)
           {
             _message.addAll(_data.data??[]) ;
             _page++;
             notifyListeners();
           }

           break;

       //
         case 500:
           serverErrorWidget(context, resp2.body,title: kDebugMode?"Frome get Home APi":null);
           break;

       //
         default :
           print("Responce from get chat api ${resp2.statusCode} \n ${resp2.body}");
           break;

       }
       _loadingMoreChat = false;
       notifyListeners();

     }

  }

  //
  handelEvent(String data)
  {
    var _d = jsonDecode(data);

    print("this is event ${data}");

    if(_d["event"]=='sendMessage')
      {
        var _m = Message.fromJson(_d['data']);
        _message.insert(0, _m);
        notifyListeners();

      }


      if(_d["event"]=='gameData')
        {
          var _g = GameData.fromJson(_d);
          if(_g.openGames!.isNotEmpty)
            {
              _openGames = _g.openGames??[];
            }
          if(_g.notOpenGames!.isNotEmpty)
            {
              _notOpenGames = _g.notOpenGames??[];
            }
          notifyListeners();
        }

  }



}