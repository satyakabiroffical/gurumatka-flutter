import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text("How To Play"),
          
        ),
        
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            
            Container(
              padding: EdgeInsets.all(20),
              decoration: AppConstant.greyBoxDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  //
                  Text("In matka game when you play the game then you have 100 numbers. 00 to 99. You play with the jodi single and crossing. Then where you play the game you can connect with that and get your money.before playing the matka game you confirm that his good well is the market. Firstly play with small amount after that if you sure it's trustable then you play with big amount. In tha matka the game play with many ways. The most famous two way is this. ",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: SC.from_width(12)
                  ),),
                  SizedBox(height: SC.from_width(19),),


                  //
                  Text("Jodi game ",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SC.from_width(16)
                  ),),
                  SizedBox(height: SC.from_width(6),),


                  //
                  Text("You can pick satta number from 00 to 99 Like 23,34,45,52,22,00 ",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(12)
                  ),),
                  SizedBox(height: SC.from_width(19),),



                  //
                  Text("Crossing game",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SC.from_width(16)
                    ),),
                  SizedBox(height: SC.from_width(6),),

                  Text("Like 3x3 || 4x4 || 5x5 you can play like this ",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(12)
                    ),),

                  SizedBox(height: SC.from_width(19),),



                  DottedBorder(
                    dashPattern: [
                      6
                    ],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(4),
                    color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [

                            //
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text("Crossing ",style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: SC.from_width(12),
                                  color: AppConstant.themYellow,
                                ),)),
                                Expanded(child: Text("Cr Number\noss\ning\nno.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: SC.from_width(12),
                                  color: AppConstant.themYellow
                                ),)),
                              ],
                            ),
                            SizedBox(height: SC.from_width(19),),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text("numbers",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(12)
                                ),)),
                                Expanded(child: Text("23 22,23,24,32,33,34 42,43,44, 4 ",style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(12)
                                ))),
                              ],
                            ),
                            SizedBox(height: SC.from_width(19),),


                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: Text("4x4 = 16 numbers",style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(12)
                                ))),
                                Expanded(child: Text("23,22,23,24,25,32,33,45 34,35,42,43,44,45, 52,53,54,55. ",style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: SC.from_width(12)
                                ))),
                              ],
                            ),


                            


                          ],
                        ),
                      )),
                  


                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: SC.from_width(13),

                    ),

                    padding: EdgeInsets.symmetric(
                      horizontal:SC.from_width(24),

                    ),
                    height: SC.from_width(54),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Text('1 Amount 95 Amount = 95 Amount 10 Amount x 95 Amount = 950 Amount ',style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: SC.from_width(12)
                    ),
                    textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: SC.from_width(13),),
                  
                  
                  Text("Hruf",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SC.from_width(16)
                  )),
                  
                  Text('1 Amount x 9 Amount= 9 Amount',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(12)
                  ))
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
