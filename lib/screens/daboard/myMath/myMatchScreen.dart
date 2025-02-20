import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/chat_provider.dart';
import 'package:guru_matka_new/component/myMatchTileClosed.dart';
import 'package:guru_matka_new/component/myMatchTileLive.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:provider/provider.dart';

class MyMatchScreen extends StatelessWidget {
  const MyMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: SizedBox(),
        title: Text("My Match"),
      ),

      body: Consumer<SocketProvider>(builder: (context, p, child) {
        return ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 0
          ),
          children: [


            CarouselSlider(

              //
              options: CarouselOptions(
                viewportFraction: 1,
                height: SC.from_width(124),
                enableInfiniteScroll: p.openGames.length>1
              ),

              //
              items:(p.openGames.length>0)?List.generate(p.openGames.length, (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyMatchTileLive(game: p.openGames[index]),
              ),):[Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: MyMatchTileLive(noLiveGame: true,),
              )],
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: SC.from_width(18),
                horizontal: 20
              ),
              child: Text("Completed",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: SC.from_width(16)
                ),),
            ),

            if(kDebugMode)
              Text("close data ${p.notOpenGames.length}"),

            if(kDebugMode)
              Text("Open data ${p.openGames.length}"),

            if(p.notOpenGames.length>0)...{
              for(var i in p.notOpenGames)
                Padding(
                  padding:  EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: SC.from_width(13)
                  ),
                  child: MyMatchTileClosed(
                    game: i,
                  ),
                )
            }
            else...{
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: MyMatchTileClosed(noCloseGame: true,),
              ),
            },
            


          ],
        );
      },),

    );
  }
}
