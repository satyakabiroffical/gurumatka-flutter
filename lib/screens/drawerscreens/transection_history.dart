import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/allTransectionprovider.dart';
import 'package:guru_matka_new/component/DipositHistoryTile.dart';
import 'package:guru_matka_new/component/TransectionTile.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/withdrawHistoryTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';


class TransectionHistoryScreen extends StatefulWidget {
  const TransectionHistoryScreen({super.key});

  @override
  State<TransectionHistoryScreen> createState() => _TransectionHistoryScreenState();
}

class _TransectionHistoryScreenState extends State<TransectionHistoryScreen> {
  
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AllTransectionProvider>(context,listen: false).getTransection(context);
    _controller.addListener(() {
      if(_controller.position.pixels==_controller.position.maxScrollExtent)
      {
        Provider.of<AllTransectionProvider>(context,listen: false).loadMore(context);
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(

        appBar: AppBar(
          title: Text("History"),
        ),

        body:Consumer<AllTransectionProvider>(builder: (context, p, child) {
          if(p.loading)
            {
              Center(
                child: CircularProgressIndicator(),
              );
            }

          return  ListView(
            padding: EdgeInsets.all(20),
            children: [

              for(var i in p.transactions)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TransactionTile(data: i),
                ),

              if(p.loading)
                Center(child: CircularProgressIndicator(),)

            ],
          );
        },),

      ),
    );
  }
}
