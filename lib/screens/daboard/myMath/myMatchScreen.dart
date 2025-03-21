import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/chat_provider.dart';
import 'package:guru_matka_new/Controllers/my%20betting%20provider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/myMatchTileClosed.dart';
import 'package:guru_matka_new/component/myMatchTileLive.dart';
import 'package:guru_matka_new/component/userBettingWidget.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:provider/provider.dart';

class MyMatchScreen extends StatefulWidget {
  const MyMatchScreen({super.key});

  @override
  State<MyMatchScreen> createState() => _MyMatchScreenState();
}

class _MyMatchScreenState extends State<MyMatchScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    Provider.of<MyBettingProvider>(context,listen: false).loadBatting(context);
    controller.addListener(() {
      if(controller.position.pixels==controller.position.maxScrollExtent)
        {
          print("${controller.position.pixels}");
          Provider.of<MyBettingProvider>(context,listen: false).loadMore(context);
        }
    },);
  }


  final ScrollController controller = ScrollController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: SizedBox(),
        title: Text("My Match"),
      ),

      body: Consumer<MyBettingProvider>(builder: (context, p, child) {



        return ListView(
          controller: controller,
          padding: EdgeInsets.symmetric(
              horizontal: 0
          ),
          children: [

            if(kDebugMode)
              Text("pagecount ${p.page} - totlal paGE ${p.totalPage} - LETH${p.data.length}"),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownMenu(



                textStyle: TextStyle(color: AppConstant.themYellow,fontWeight: FontWeight.w700),

                inputDecorationTheme: InputDecorationTheme(

                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),

                enableSearch: true,

                onSelected: (value) => p.filter(context, value),

                  dropdownMenuEntries: [

                DropdownMenuEntry(value: null, label: "All"),
                DropdownMenuEntry(value: "JODI", label: "Jodi"),
                DropdownMenuEntry(value: "CROSSING", label: "Crossing"),
                DropdownMenuEntry(value: "HARUF", label: "Hruf"),


              ]),
            ),

            
            if(p.loading)
              AspectRatio(aspectRatio: 1,child: Center(child: CircularProgressIndicator(),),),

            if(p.loading==false)
              for(var i in p.data)
                UserBettingWidget(data: i),

            if(p.loadingMore)
              Center(child: CircularProgressIndicator(),)



          ],
        );
      },),

    );
  }
}
