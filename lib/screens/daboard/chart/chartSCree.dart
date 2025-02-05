import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/chartTile.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     

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
              Text("Select Date to see the winners",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(14)
              ),),
              
              //
              IconButton(onPressed: (){
                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(3000));
              }, icon: Icon(Icons.date_range)),


            ],
          ),

          //
          for(int i = 0;i<7;i++)
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30
              ),
              child: ChartTile(),
            )
          
        ],
      ),

    );
  }
}
