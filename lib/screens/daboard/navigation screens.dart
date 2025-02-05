
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/screens/daboard/chart/chartSCree.dart';
import 'package:guru_matka_new/screens/daboard/home/homeScreen.dart';
import 'package:guru_matka_new/screens/daboard/myMath/myMatchScreen.dart';


class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  PageController _pageController = PageController(initialPage: 0);

  int _curruntIndex = 0;

  List<Map<String,String>> icons =[

    //
    {
      'icon':'assets/navigation icon/home.png',
      'label':'Home',
    },
    //
    {
      'icon':'assets/navigation icon/chart.png',
      'label':'Chart',
    },
    //
    {
      'icon':'assets/navigation icon/my match.png',
      'label':'My Matches',
    },
    //
    {
      'icon':'assets/navigation icon/chat.png',
      'label':'Chat',
    },
    //
    {
      'icon':'assets/navigation icon/share and earn.png',
      'label':'Share & Earn',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        backgroundColor: Colors.transparent,

        body: Column(
          children: [
            //
            Expanded(child: PageView(

              physics: (kDebugMode)?null:NeverScrollableScrollPhysics(),

              controller: _pageController,

              children: [


                //
                HomeScreen(),

                //
                ChartScreen(),

                //
                MyMatchScreen(),

                //
                Container(color: Colors.green,child: Center(child: Text("devlopment"))),

                //
                Container(color: Colors.lightBlue,child: Center(child: Text("devlopment"))),
              ],

            )),
            //Navigation bar
            Container(
              color: Colors.black,
              height: SC.from_width(80),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Theme(
                data: ThemeData(
                  colorScheme: ColorScheme.light(
                      primary: AppConstant.themYellow
                  )
                ),
                child: BottomNavigationBar(


                  backgroundColor: Colors.black,

                  selectedLabelStyle: TextStyle(
                    color: Colors.white,
                    fontSize: SC.from_width(12),
                    fontWeight: FontWeight.w400
                  ),

                  unselectedLabelStyle: TextStyle(
                    color: Colors.white,
                      fontSize: SC.from_width(12),
                      fontWeight: FontWeight.w400
                  ),


                  showUnselectedLabels: true,

                  currentIndex: _curruntIndex,
                  onTap: (n){
                    _curruntIndex = n;
                    _pageController.jumpToPage(_curruntIndex);
                    setState(() {
                    });
                  },


                  items: List.generate(icons.length, (index) => BottomNavigationBarItem(
                    icon: Image.asset(icons[index]['icon']??'',height: SC.from_width(25)),
                    label: icons[index]['label']??'',
                    backgroundColor: Colors.black,
                    activeIcon: Image.asset(icons[index]['icon']??'',height: SC.from_width(25),color: AppConstant.themYellow,)
                  ),),
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
