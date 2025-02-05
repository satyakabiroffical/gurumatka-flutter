import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/ChatBubble.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/chartTile.dart';
import 'package:guru_matka_new/component/messageFeals.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Card(
        child: MessageField(),
      ),

      body: CustomScrollView(
        slivers: [

          //
          SliverAppBar(
            leading: SizedBox(),
            title: Text("Help & Support"),
            expandedHeight: SC.from_width(386), // Height when fully expanded
            floating: false, // Stays visible when scrolling up
            pinned: true, // Sticks to the top when collapsed
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                AIcon.chatAppBarBgImage,
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Column(
              children: [
                
                //
                MyChatBubble(
                  text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod?',
                  isSender: true,
                ),

                //
                MyChatBubble(
                  text: 'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.',
                ),

              ],
            ),
          )

        ],
      ),

    );
  }
}
