import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/transection%20provider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/DipositHistoryTile.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/withdrawHistoryTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';




class DipositHistoryScreen extends StatefulWidget {
  const DipositHistoryScreen({super.key});

  @override
  State<DipositHistoryScreen> createState() => _DipositHistoryScreenState();
}

class _DipositHistoryScreenState extends State<DipositHistoryScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TransectionProvider>(context,listen: false).getTransection();
    _controller.addListener(
        (){
          if(_controller.position.pixels==_controller.position.maxScrollExtent)
          {
            Provider.of<TransectionProvider>(context,listen: false).loadMore();
          }
        }
    );
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BackGround(


      child:WillPopScope(

        onWillPop: ()async{
          Provider.of<TransectionProvider>(context,listen: false).clear();
        return true;
        },

        //
      child:  Scaffold(


        //
        floatingActionButton: kDebugMode?FloatingActionButton(onPressed: (){
          Provider.of<TransectionProvider>(context,listen: false).getTransection();
        }):null,


        appBar: AppBar(
          title: Text("Deposit History"),

          actions: [

            //
            Consumer<TransectionProvider>(builder: (context, p, child) => PopupMenuButton(
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

        body: Consumer<TransectionProvider>(
          builder: (context, p, child) {
            if(p.loading)
            {
              return Center(child: CircularProgressIndicator(),);
            }

            return ListView.builder(
              controller: _controller,
              itemCount: p.filterTransactions.length,

              //
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: SC.from_width(22)),

                //
                child: DipositHistoryTile(
                  transaction: p.filterTransactions[index],
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),

            );
          },

        ),

      ),)
    );
  }
}
