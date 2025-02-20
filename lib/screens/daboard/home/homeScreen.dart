import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/Controllers/homeProvider.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/apiService/game_api.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:guru_matka_new/component/AppConstent.dart';

import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/GamsScreens/games_Screens.dart';
import 'package:guru_matka_new/screens/daboard/home/drawer.dart';
import 'package:guru_matka_new/screens/homeSubScreens/notificationscreens.dart';
import 'package:guru_matka_new/screens/walletscreens/walletSCreend.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenWinning.dart';
import 'package:provider/provider.dart';

import '../../../Controllers/chat_provider.dart';
import '../../../component/appIcons.dart';
import '../../../component/provfileAvtar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<SocketProvider>(context,listen: false).initChannel(onEvent: (s){});
    Provider.of<HomeProvider>(context, listen: false).getHome(context);
    Provider.of<ProfileProvider>(context, listen: false).getUser(context);
    Provider.of<AuthProvider>(context, listen: false)
        .showMessage(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,

      floatingActionButton: kDebugMode
          ? FloatingActionButton(onPressed: () async {
              // var _d = await UserPref().getHeader();
              // print(_d);
              //

              Provider.of<AuthProvider>(context, listen: false)
                  .showMessage(context);


        GamesAPi().getAllGames();
       
            })
          : null,

      drawer: AppDrawer(),

      //
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SC.from_width(60)),
          child: Consumer<ProfileProvider>(
            builder: (context, p, child) => AppBar(
              //
              centerTitle: true,

              //Profile Image
              leading: Builder(
                builder: (context) => IconButton(
                  icon: ProfieleAvtar(
                    redias: SC.from_width(52),
                    child: Hero(
                      tag: AIcon.sampleProfile,

                      //
                      child: (p.user?.image != null)
                          ? Image.network(
                              '${MyUrl.bucketUrl}${p.user?.image}',
                              fit: BoxFit.cover,
                            )
                          : Icon(Icons.person,color: AppConstant.themYellow,size: SC.from_width(25),),
                    ),
                  ), // Custom drawer icon
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Works inside Builder
                  },
                ),
              ),

              title: Image.asset(
                "assets/mainImage/splashScreenLogo.png",
                height: SC.from_width(73),
              ),

              actions: [
                //wallet
                IconButton(
                    onPressed: () {
                      RouteTo(
                        context,
                        child: (p0, p1) => WalletScreenMain(),
                      );
                    },
                    icon: Row(
                      children: [
                        // Icon(Icons.wallet),
                        Image.asset(
                          AIcon.wallet,
                          height: SC.from_width(20),
                        ),
                        SizedBox(
                          width: SC.from_width(2),
                        ),
                        Text(
                          "₹${p.user?.walletBalance ?? '0'}",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: SC.from_width(18)),
                        )
                      ],
                    )),

                //
                FutureBuilder(
                  future: OtherApi().getNotificationCount(),
                  builder: (context, snapshot) {
                    // return Text("${snapshot.data?.statusCode}");

                    return Container(
                      margin: EdgeInsets.only(right: 10),
                      height: SC.from_width(30),
                      width: SC.from_width(30),
                      child: Stack(
                        children: [
                          //
                          IconButton(
                              onPressed: () {
                                RouteTo(
                                  context,
                                  child: (p0, p1) => NotificationScreen(),
                                );
                              },
                              icon: Icon(Icons.notifications)),

                          if (snapshot.data?.statusCode == 200)
                            if ((jsonDecode(snapshot.data?.body ?? '')["data"] ?? 0) > 0)
                              Positioned(
                                right: SC.from_width(0),
                                top: SC.from_width(5),
                                child: Container(
                                  height: SC.from_width(13),
                                  width: SC.from_width(13),
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: FittedBox(
                                      child: Text(
                                    "${jsonDecode(snapshot.data?.body ?? '')["data"]}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),
                                ),
                              )
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )),

      body: Consumer<HomeProvider>(
        builder: (context, p, child) {
          if (p.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: [
              //
              SizedBox(
                height: SC.from_width(24),
              ),
              CarouselSlider(

                  //
                  items: List.generate(
                    p.banners.length,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          '${MyUrl.bucketUrl}${p.banners[index]}',
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return CupertinoActivityIndicator();
                            }
                            return child;
                          },
                        ),
                      ),
                    ),
                  ),
                  options: CarouselOptions(
                    enableInfiniteScroll: p.banners.length < 1,
                    autoPlay: true,
                    viewportFraction: 1,
                  )),
              // Image.network('${MyUrl.bucketUrl}${p.banners[0]}'),
              SizedBox(
                height: SC.from_width(24),
              ),

              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Live Games",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: SC.from_width(18),
                  ),
                ),
              ),
              SizedBox(
                height: SC.from_width(7),
              ),

              //
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () {
                      RouteTo(
                        context,
                        child: (p0, p1) => GamesScreen(),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        '${MyUrl.bucketUrl}${p.mainBanners}',
                        // loadingBuilder: (context, child, loadingProgress) => Text('${loadingProgress?.cumulativeBytesLoaded}'),
                        fit: BoxFit.cover,
                      ),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
