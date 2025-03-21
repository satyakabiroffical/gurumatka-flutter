import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/resulteProvider.dart';
import 'package:guru_matka_new/component/chartTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ResultProvider>(context,listen: false).clear();
    Provider.of<ResultProvider>(context,listen: false).getResulte(context);
  }

  @override
  Widget build(BuildContext context) {



    return Consumer<ResultProvider>(

      //
      builder: (context, p, child){


        return Scaffold(

          //
          floatingActionButton: kDebugMode?FloatingActionButton(onPressed: (){
            p.getResulte(context);
          }):null,

          appBar: AppBar(
            title: Text("Chart"),
            leading: SizedBox(),
          ),

          //
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            children: [


              // Top Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //
                  Text("Select Date To See The Winners",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SC.from_width(14)
                    ),),

                  //
                  IconButton(onPressed: ()async{
                    var d = await showDatePicker(context: context,
                        currentDate:DateTime.now().subtract(Duration(hours: 24)) ,
                        firstDate: DateTime(1000),
                        lastDate: DateTime.now().subtract(Duration(hours: 24)),

                      // confirmText:"Text 1",
                      // barrierLabel: 'Text 2',
                      // cancelText: 'Text 3',
                      // fieldStartHintText: 'Text 4',
                      helpText: 'Please Select',
                      // fieldEndLabelText: 'Text 6',
                      // fieldEndHintText: 'Text 7',
                      // fieldStartLabelText: 'Text 8',
                      // saveText: 'Text 9',


                    );

                    print(d);

                    if(d!=null)
                      {
                        p.filterByDateTime(context, startDate: d, endDate: d);
                      }
                  }, icon: Icon(Icons.date_range)),


                ],
              ),

              //
              if(p.loading)...{
                //
                Center(
        child: CircularProgressIndicator(),
        )
              }
              else if(p.result.isEmpty)...{

                //

                AspectRatio(
                  aspectRatio: 1,
                  child: Container(

                    alignment: Alignment.center,
                    child: Text("No Result Announce"),
                  ),
                )

              }
              else...{

                for(var i in p.result)
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 30
                    ),
                    child: ChartTile(resultData: i),
                  )
        }

            ],
          ),

        );
      } ,

    );
  }
}
