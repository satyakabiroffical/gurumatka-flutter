import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/Controllers/game%20provider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/CustomFeild.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:provider/provider.dart';


class GameTab2 extends StatefulWidget {
  final Game? game;
  const GameTab2({required this.game,super.key});

  @override
  State<GameTab2> createState() => _GameTab2State();
}

class _GameTab2State extends State<GameTab2> {


  var key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    return Consumer<GameProvider>(

      //
      builder: (context, p, child) => Form(
        key: key,
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20
          ),
          children: [


            //
            Container(
              padding: EdgeInsets.symmetric(horizontal: SC.from_width(17)),
              height: SC.from_width(260),

              //
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  CustomFeild(

                    validator: (d)
                    {
                      if(d!.length<2)
                        {
                          return 'Given Number Must Be Two Digit Number';
                        }
                      // if(d.toString()[0]==d.toString()[1])
                      //   {
                      //     return 'Digit Must Be Different';
                      //   }
                      if(p.isCrossingValueValid(d??''))
                        {
                          return 'Digit Must Be Different';
                        }


                    },

                    controller: p.crossingValue,
                      inputType: TextInputType.number,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      label: "Crossing Number"),

                  CustomFeild(
                    validator: (d){
                      if(d==null||d.isEmpty)
                        {
                          return 'Enter Amount';
                        }
                      else if(int.parse(d.toString())<=0)
                        {
                          return 'Enter Amount Greater Then 0';
                        }
                    },
                    controller: p.crossingAmount,
                      formatters: [
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      inputType: TextInputType.number,
                      label: "Crossing into Amount"),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    //
                    title: Text("*Crossing Amount Below 5000"),

                    //
                    subtitle: Row(children: [
                      Checkbox(

                          value: p.jodiCut, onChanged: (d){
                            p.switchJodi();
                      }),
                      Text("Joda Cut")

                    ],),
                  )

                ],
              ),


            ),
            SizedBox(height: SC.from_width(27),),

            //
            CustomButton(
              onTap: (){
                if(key.currentState!.validate())
                    {
                      var t = p.crossingGameResult();
                      print(t);
                    }
              },
                title: 'Save'),
            SizedBox(height: SC.from_width(27),),

            //
            Center(
              child: Text("Total Number Of Crossing",style:TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(16),

              ),),
            ),
            SizedBox(height: SC.from_width(18),),


            //
            Container(
              padding: EdgeInsets.all(20),
              decoration: AppConstant.greyBoxDecoration,
              child: Column(
                children: [

                  Row(
                    children: [
                      Text('No.'),
                      Spacer(),
                      Text("Amount")
                    ],
                  ),

                  //
                  Divider(),


                  //
                  for(var i in p.crossingGameResult())
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      child: Row(
                        children: [
                          Text(' ${i.toString().padLeft(2,'0')}'),
                          Spacer(),
                          Text("₹ ${p.crossingAmount.text}")
                        ],
                      ),
                    )
                ],
              ),
            ),
            SizedBox(height: SC.from_width(31),),


            //
            Container(
              // height: SC.from_width(58),
              decoration: AppConstant.greyBoxDecoration,

              //
              child: ListTile(

                //
                title: Text('Total Amount'),
                //
                subtitle: Text("${int.parse(p.crossingAmount.text.isNotEmpty?p.crossingAmount.text:'0')*p.crossingResult.length}"),
                // subtitle: Text("0"),

                //
                trailing: SizedBox(
                    height: SC.from_width(34),
                    width: SC.from_width(88),child: CustomButton(title: "Submit")),

                //
                titleTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: SC.from_width(14)
                ),

                //
                subtitleTextStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SC.from_width(18)
                ),

              ),
            )


          ],
        ),
      ),

    );
  }
}
