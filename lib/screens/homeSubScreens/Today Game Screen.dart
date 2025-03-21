import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/resulteProvider.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/chartTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';



class TodayResultWidget extends StatefulWidget {
  const TodayResultWidget({super.key});

  @override
  State<TodayResultWidget> createState() => _TodayResultWidgetState();
}

class _TodayResultWidgetState extends State<TodayResultWidget> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ResultProvider>(context,listen: false).getResulte(context);
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: WillPopScope(
        onWillPop: () async {
          Provider.of<ResultProvider>(context,listen: false).clear();
          return true;
        },
        child: Scaffold(
      
          //
          appBar: AppBar(
            title: Text("Result"),
          ),
      
      
      
          body: Consumer<ResultProvider>(
            builder: (context, p, child){
      
              if(p.loading)
                {
                  return Center(child: CircularProgressIndicator());
                }
      
              if(p.result.isEmpty)
                {
                  return Center(child: Text("No Result Found"),);
                }
      
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
      
                separatorBuilder: (context, index) => SizedBox(height: SC.from_width(20),),
      
                itemCount: p.result.length,
                
                
                //
                itemBuilder: (context, index) => ChartTile(resultData: p.result[index]),
              );
      
            },
          ),
      
        ),
      ),
    );
  }
}
