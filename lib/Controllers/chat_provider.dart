 import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/models/chat_resp.dart';
import 'package:guru_matka_new/models/thread_data.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatProvider with ChangeNotifier
{
  final _otherAPi = OtherApi();
  ThreadData? _threadId;
  int _page = 1;
  bool _loading = true;
  TextEditingController _messageController =TextEditingController();

  List<Message> _message = [];
  ThreadData? get threadId =>_threadId;
  List<Message> get message => _message;
  TextEditingController get messageController =>_messageController;
  bool get loading => _loading;

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
                _page++;
              }
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


  sendMessage(BuildContext context,WebSocketChannel channel,ScrollController sc)
  {
    var m  = {
      "threadId":_threadId?.id??'', // Replace with actual thread ID
      "message":_messageController.text.trim(),
      "type": "USER",
      'userId':Provider.of<ProfileProvider>(context,listen: false).user?.id,
      'adminId':_threadId?.adminId??'',
    };
    print(m);
    channel.sink.add(jsonEncode(m));
    _messageController.clear();
    notifyListeners();
  }

  handelEvent(String data)
  {
    var _d = jsonDecode(data);
    var _m = Message.fromJson(_d);
    _message.insert(0, _m);
    notifyListeners();

  }



  loadMoreChat(BuildContext context) async
  {

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
      default :
        print("Responce from get chat api ${resp2.statusCode} \n ${resp2.body}");
        break;
    }

  }

  //



}