import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/chat_provider.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/ChatBubble.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/chartTile.dart';
import 'package:guru_matka_new/component/messageFeals.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late WebSocketChannel channel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<SocketProvider>(context,listen: false).lodeChats(context);

  }



  // SliverAppBar(
  // leading: SizedBox(),
  // title: Text("Help & Support"),
  // expandedHeight: SC.from_width(386), // Height when fully expanded
  // floating: false, // Stays visible when scrolling up
  // pinned: true, // Sticks to the top when collapsed
  // flexibleSpace: FlexibleSpaceBar(
  // background: Image.asset(
  // AIcon.chatAppBarBgImage,
  // ),
  // ),
  // ),




  ScrollController scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return true;
      },
      child: Scaffold(

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,



        body: Consumer<SocketProvider>(

          builder: (context, p, child) {


            if(p.loading)
              {
                return Center(child: CircularProgressIndicator(),);
              }

            return Column(
              children: [

                //
                Expanded(child: p.message.length==0?
            Center(child: Image.asset(AIcon.chatAppBarBgImage)):
                RefreshIndicator(



                  onRefresh: ()async{
                    Provider.of<SocketProvider>(context,listen: false).loadMoreChat(context);
                  },
                  child: ListView.builder(
                    controller: scrollController,
                    padding: EdgeInsets.only(top: SC.from_width(40)),
                    reverse: true,
                    itemCount: p.message.length,
                    itemBuilder: (context, index) => MyChatBubble(message: p.message[index]),
                  ),
                )),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: MessageField(
                    controller: p.messageController,
                    onSend: (){
                      if(p.messageController.text.trim().isNotEmpty)
                      {
                        p.sendMessage(context,scrollController);
                      }
                    },
                  ),
                )

                //
              ],
            );
          },

        ),

      ),
    );
  }
}
