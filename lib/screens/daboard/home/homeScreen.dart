import 'dart:convert';
import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/Controllers/homeProvider.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/Controllers/resulteProvider.dart';
import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/apiService/game_api.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/apiService/sred_predrence_db.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/LiveGamesTile.dart';
import 'package:guru_matka_new/component/chartTile.dart';
import 'package:guru_matka_new/component/comming%20soon.dart';

import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/verifyOTpREsponce.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/push_notification/notification%20service.dart';
import 'package:guru_matka_new/screens/GamsScreens/games_Screens.dart';
import 'package:guru_matka_new/screens/daboard/home/drawer.dart';
import 'package:guru_matka_new/screens/homeSubScreens/Today%20Game%20Screen.dart';
import 'package:guru_matka_new/screens/homeSubScreens/notificationscreens.dart';
import 'package:guru_matka_new/screens/walletscreens/walletSCreend.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenAdd.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenWinning.dart';
import 'package:guru_matka_new/screens/walletscreens/widrawHisteryScreen.dart';
import 'package:guru_matka_new/screens/walletscreens/widrawScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Controllers/chat_provider.dart';
import '../../../component/appIcons.dart';
import '../../../component/provfileAvtar.dart';

class HomeScreen extends StatefulWidget {
  final PageController controller;
  const HomeScreen({required this.controller,super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Provider.of<SocketProvider>(context, listen: false)
        .initChannel(onEvent: (s) {});
    Provider.of<HomeProvider>(context, listen: false).getHome(context);
    Provider.of<ProfileProvider>(context, listen: false).getUser(context);
    Provider.of<AuthProvider>(context, listen: false).showMessage(context);
    Provider.of<ResultProvider>(context, listen: false).getTodyResult(context);
  }

  @override
  Widget build(BuildContext context) {
    var bannerJeignt = SC.from_width(160);

    return Scaffold(
      backgroundColor: Colors.transparent,

      // floatingActionButton: FloatingActionButton(
      //     child: Image.asset("assets/icons/whatsApp.webp"),
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(SC.from_width(100))),
      //     onPressed: () async {
      //       if (kDebugMode) {
      //         var user = await UserPref().getUser();
      //         print("User ID = ${user?.id}");
      //         await NotificationService().getPermission();
      //
      //         // await AwesomeNotifications().requestPermissionToSendNotifications();
      //
      //         // var req = await Permission.notification.request();
      //
      //         AwesomeNotifications().createNotification(
      //             content: NotificationContent(
      //                 id: 0,
      //                 channelKey: "channelKey",
      //                 title: "sdfa",
      //                 body: "asdfasdf"));
      //
      //         //
      //
      //         // log("message  ${req.isGranted}");
      //       }
      //     }),

      drawer: AppDrawer(),

      //
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(SC.from_width(60)),
          child: Consumer<ProfileProvider>(
            builder: (context, p, child) => AppBar(
              //
              centerTitle: false,

              //Profile Image
              leading: Builder(
                builder: (context) => IconButton(
                  icon: ProfieleAvtar(
                    redias: SC.from_width(52),
                    child: (p.user?.image != null)
                        ? Image.network(
                            '${MyUrl.bucketUrl}${p.user?.image}',
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.person,
                            color: AppConstant.themYellow,
                            size: SC.from_width(25),
                          ),
                  ), // Custom drawer icon
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // Works inside Builder
                  },
                ),
              ),

              title: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: InkWell(
                  onTap: () => commingSoon(context),
                  child: Image.asset(
                    "assets/icons/spiner.gif",
                    height: SC.from_width(35),
                  ),
                ),
              ),

              //
              flexibleSpace: FlexibleSpaceBar(
                background: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: SC.from_width(30)),
                    child: Image.asset(
                      "assets/mainImage/splashScreenLogo.png",
                      height: SC.from_width(73),
                    ),
                  ),
                ),
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
                          "₹${(p.user?.walletBalance ?? '0')}",
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
                              onPressed: () async {
                                //
                                await RouteTo(
                                  context,
                                  child: (p0, p1) => NotificationScreen(),
                                );

                                setState(() {});
                              },
                              icon: Icon(Icons.notifications)),

                          if (snapshot.data?.statusCode == 200)
                            if ((jsonDecode(
                                        snapshot.data?.body ?? '')["data"] ??
                                    0) >
                                0)
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
          return RefreshIndicator(
            onRefresh: () async {
              await p.getHome(context);
              await Provider.of<ProfileProvider>(context, listen: false)
                  .getUser(context);
            },
            child: ListView(
              padding: EdgeInsets.only(bottom: SC.from_width(20)),
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
                            height: bannerJeignt,
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

                    //
                    options: CarouselOptions(
                        enableInfiniteScroll: p.banners.length < 1,
                        autoPlay: true,
                        viewportFraction: 1,
                        height: bannerJeignt)),
                // Image.network('${MyUrl.bucketUrl}${p.banners[0]}'),
                SizedBox(
                  height: SC.from_width(24),
                ),
                //
                // //
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   child: Text(
                //     "Live Games",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontWeight: FontWeight.w700,
                //       fontSize: SC.from_width(18),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: SC.from_width(7),
                // ),
                //
                // //
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: GestureDetector(
                //       onTap: () {
                //         RouteTo(
                //           context,
                //           child: (p0, p1) => GamesScreen(),
                //         );
                //       },
                //       child: ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: Image.network(
                //           '${MyUrl.bucketUrl}${p.mainBanners}',
                //           // loadingBuilder: (context, child, loadingProgress) => Text('${loadingProgress?.cumulativeBytesLoaded}'),
                //           fit: BoxFit.cover,
                //           height: bannerJeignt,
                //         ),
                //       )),
                // ),
                // SizedBox(
                //   height: SC.from_width(15),
                // ),

                GridView(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: SC.from_width(70),
                    mainAxisSpacing: SC.from_width(5),
                    crossAxisSpacing: SC.from_width(5),
                  ),
                  primary: false,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    //
                    CustomButtonWithIcon(
                      
                      icon: Image.asset(AIcon.resultHome),
                        onTap: () {
                        widget.controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.linear);
                        },
                        title: "Result"),

                    //
                    CustomButtonWithIcon(
                      icon: Image.asset(AIcon.whatAppNew),
                        onTap: () {
                          launch('https://wa.me/9416869223');
                        },
                        title: "WhatsApp"),

                    //
                    CustomButtonWithIcon(
                      icon: Image.asset(AIcon.addMoneyHome),
                        onTap: () {
                          RouteTo(
                            context,
                            child: (p0, p1) => WalletScreenAdd(),
                          );
                        },
                        title: "Add Money"),

                    //
                    CustomButtonWithIcon(
                      icon: Image.asset(AIcon.withdrawIconHome),
                        onTap: () {
                          RouteTo(
                            context,
                            child: (p0, p1) => WidrawScreen(),
                          );
                        },
                        title: "Withdraw"),
                  ],
                ),
                
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: SC.from_width(8)),
                  child: CustomButtonWithIcon(

                    onTap: (){
                      launch("https://t.me/+REZeRhdlyrBmNTRl");
                    },

                    //
                    icon: Image.asset("assets/icons/tel.webp",color: Color.fromRGBO(0, 136, 204,1),fit: BoxFit.cover,),

                    centerTitle: true,
                      title: "Join Our Talegram"),
                ),

                
                
                




                //
                 Consumer<SocketProvider>(builder: (context, p, child){

                   if(p.openGames.isNotEmpty)
                     {
                       return Column(
                         children: [
                           SizedBox(height: 20,),

                           //
                           Row(
                             children: [
                               Padding(
                                 padding:  EdgeInsets.symmetric(horizontal: 20),
                                 child: Text("Live Games",style: TextStyle(
                                   color: Colors.white,
                                   fontWeight: FontWeight.w700,
                                   fontSize: SC.from_width(18)
                                 ),),
                               ),
                             ],
                           ),

                           //
                           ListView.separated(
                             padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                             primary: false,
                             shrinkWrap: true,
                             separatorBuilder: (context, index) => SizedBox(height:SC.from_width(10),),
                             physics: NeverScrollableScrollPhysics(),
                             itemCount: p.openGames.length,
                               itemBuilder: (context, index) => LiveGameTile(game: p.openGames[index],),
                           ),
                         ],
                       );
                     }
                   return SizedBox();
                 }),



                //
                Consumer<ResultProvider>(builder: (context, p, child){

                  if(p.todayResult.isNotEmpty)
                  {
                    return Column(
                      children: [
                        SizedBox(height: 20,),

                        //
                        Row(
                          children: [
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20),
                              child: Text("Today Result",style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: SC.from_width(18)
                              ),),
                            ),
                          ],
                        ),

                        //
                        ListView.separated(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                          primary: false,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => SizedBox(height:SC.from_width(10),),
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: p.todayResult.length,
                          itemBuilder: (context, index) => ChartTile(resultData: p.todayResult[index]),
                        ),
                      ],
                    );
                  }
                  return SizedBox();
                }),




              ],
            ),
          );
        },
      ),
    );
  }
}
