import 'package:flutter/foundation.dart';
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
import 'package:guru_matka_new/screens/GamsScreens/gameTab/haruf%20result%20widget.dart';
import 'package:provider/provider.dart';


class GameTab3 extends StatefulWidget {
  final Game? game;
  const GameTab3({required this.game,super.key});

  @override
  State<GameTab3> createState() => _GameTab3State();
}

class _GameTab3State extends State<GameTab3> {





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


            if(kDebugMode)
              Text('${p.harufData}'),

            Container(
              padding: EdgeInsets.all(SC.from_width(15)),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Row(
                children: [
                
                Expanded(child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children:
                [

                  Text("Andar Game",
                  style: TextStyle(fontSize: SC.from_width(16,),fontWeight: FontWeight.w400),),
                  SizedBox(height: SC.from_width(8),),
                  
                  for(int i=0; i<10;i++)
                    Row(
                      children: [

                        //
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 3 
                          ),
                          alignment: Alignment.center,
                          height: SC.from_width(50),
                          width: SC.from_width(65),
                          decoration: AppConstant.greyBoxDecoration,
                            child: Text("A$i")),
                        SizedBox(width: SC.from_width(2),),

                        //
                        Container(
                            margin: EdgeInsets.only(
                                bottom: 3
                            ),
                            alignment: Alignment.center,
                            height: SC.from_width(50),
                            width: SC.from_width(65),
                            decoration: AppConstant.greyBoxDecoration,
                            child: TextFormField(
                              initialValue: '${p.harufData["A$i"]??''}',
                              onChanged: (d){
                                p.addHarufData("A$i",d);
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              //
                              decoration: InputDecoration(
                                hintText: '00',
                                contentPadding: EdgeInsets.zero
                              ),
                            ))
                      ],
                    )

                ],)),
                SizedBox(width: SC.from_width(20),),

                Expanded(child:Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children:
                  [

                    Text("Bahar Game",
                      style: TextStyle(fontSize: SC.from_width(16,),fontWeight: FontWeight.w400),),
                    SizedBox(height: SC.from_width(8),),

                    for(int i=0; i<10;i++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,

                        children: [

                          //
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 3
                              ),
                              alignment: Alignment.center,
                              height: SC.from_width(50),
                              width: SC.from_width(65),
                              decoration: AppConstant.greyBoxDecoration,
                              child: Text("B$i")),
                          SizedBox(width: SC.from_width(2),),

                          //
                          Container(
                              margin: EdgeInsets.only(
                                  bottom: 3
                              ),
                              alignment: Alignment.center,
                              height: SC.from_width(50),
                              width: SC.from_width(65),
                              decoration: AppConstant.greyBoxDecoration,
                              child: TextFormField(

                                onChanged: (d){

                                  p.addHarufData("B$i", d);

                                },
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                //
                                decoration: InputDecoration(
                                  hintText: '00',
                                    contentPadding: EdgeInsets.zero
                                ),
                              ))
                        ],
                      )

                  ],))

              ],),
            ),




            //
            CustomButton(
                onTap: (){

                },
                title: 'Save'),
            SizedBox(height: SC.from_width(27),),




            //
            HarufResultWidget(data: p.harufData),
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
                subtitle: Text("${p.getHarufTotle()}"),
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
