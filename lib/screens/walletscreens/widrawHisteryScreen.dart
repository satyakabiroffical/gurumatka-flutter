import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/withdrawProvider.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/withdrawHistoryTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';

import '../../component/AppConstent.dart';


class WithdrawHistoryScreen extends StatefulWidget {
  const WithdrawHistoryScreen({super.key});

  @override
  State<WithdrawHistoryScreen> createState() => _WithdrawHistoryScreenState();
}

class _WithdrawHistoryScreenState extends State<WithdrawHistoryScreen> {

  //
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WithdrawProvider>(context, listen: false).getTransection();

    _controller.addListener(
            (){
          if(_controller.position.pixels==_controller.position.maxScrollExtent)
          {
            Provider.of<WithdrawProvider>(context,listen: false).loadMore();
          }
        }
    );
  }

  final ScrollController _controller = ScrollController();


  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: WillPopScope(
        onWillPop: ()async{

          //
          Provider.of<WithdrawProvider>(context,listen: false).clear();
          return true;

        },
        child: Scaffold(

          //
          floatingActionButton: kDebugMode?FloatingActionButton(onPressed: (){
            Provider.of<WithdrawProvider>(context,listen: false).loadMore();
          }):null,
          appBar: AppBar(
            title: Text('Withdraw History'),

            actions: [
              Consumer<WithdrawProvider>(builder: (context, p, child) => PopupMenuButton(
                icon: Container(
                    decoration: AppConstant.greyBoxDecoration,
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text('${p.curruntFilter}',style: TextStyle(fontWeight: FontWeight.w700),)),
                itemBuilder:(context) => [
                  for(var i in p.tStatus)
                    PopupMenuItem(child: Text(i),value: i,)
                ],
                onSelected: (d)=>p.filter(d),
              ) )
            ],


          ),
          body: Consumer<WithdrawProvider>(
            builder: (context, p, child) {

              //
              if (p.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              
              if(p.filterTransactions.length==0)
                {
                  return Center(
                    child: Text("No History Found"),
                    
                  );
                }

              //
              return Consumer(
                builder: (context, value, child) => ListView.builder(

                  //
                  controller: _controller,

                  itemCount: p.filterTransactions.length,
                  //
                  itemBuilder: (context, i) => Padding(
                    padding: EdgeInsets.only(bottom: SC.from_width(22)),

                    //
                    child: WithdrawHistoryTile(data: p.filterTransactions[i]),
                  ),

                  //
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
