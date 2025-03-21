

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/customFormater.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/my_betting_responce_model.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';


class UserBettingWidget extends StatelessWidget {
  final MyBettingData data;
  const UserBettingWidget({required this.data,super.key});

  @override
  Widget build(BuildContext context) {

    var initExpand = false;

    //
    if(data.type=='JODI')
      {
        return Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: AppConstant.greyBoxDecoration,
            child: ExpansionTile(



              collapsedShape: InputBorder.none,
              shape: InputBorder.none,


              dense: false,
              initiallyExpanded: initExpand,
              visualDensity: VisualDensity(horizontal: 0),

              // expansionAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 500),curve: Curves.bounceOut,reverseCurve: Curves.linear),

                subtitle: Text('${data.type}',style: TextStyle(
                  fontWeight: FontWeight.w600
                ),),


              title: Text('${data.battingGameId?.name??'Unknown'}',style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppConstant.themYellow
              ),),
              
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  

                  if(data.createdAt!=null)
                    Text('${CustomFormat().formatTime(data.createdAt!.add(Duration(minutes: 330)))}',
                    style: TextStyle(
                      fontSize: SC.from_width(10,),
                      fontWeight: FontWeight.w400
                    ),),

                  if(data.createdAt!=null)
                    Text('${CustomFormat().formatDate(data.createdAt!.add(Duration(minutes: 330)))}',
                    style: TextStyle(
                      fontSize: SC.from_width(10,),
                      fontWeight: FontWeight.w400
                    ),),

                  Text('Total Amount : ${data.jodiTotalAmount}',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: SC.from_width(15),
                    color: AppConstant.themYellow
                  ),),
                  
                  
                ],
              ),
              
              
              
              children: [

                Table(
                  children: [


                    TableRow(
                      decoration: BoxDecoration(
                        color: AppConstant.themYellow
                      ),
                        children:[

                          //
                          Center(child: Text('Betting Number',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                          ),)),

                          //
                          Center(child: Text('Amount',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                          ),)),

                          //
                          Center(child: Text('Status',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                          ),)),
                        ]
                    ),

                    for(Jodi i in data.jodi??[])
                      TableRow(
                          children:[

                            //number
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('${i.jodiNum}',style: TextStyle(

                                  fontWeight: FontWeight.w700,
                                  fontSize: SC.from_width(14)
                              ))),
                            ),

                            //  amount
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('${(i.status=="LOST"?'-':(i.status=="WON")?'+':'')}${i.price}',style: TextStyle(
                                color: (i.status=="LOST"?Colors.red:(i.status=="WON")?Colors.green:null),
                                  fontWeight: FontWeight.w700,
                                  fontSize: SC.from_width(14)
                              ))),
                            ),


                            //status
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('${i.status}',style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: SC.from_width(14)
                              ))),
                            )
                          ]
                      )
                  ],
                ),


               // if(kDebugMode)
               //   Text("${data.toJson()}")
              ],

            ));
      }

    //
    if(data.type=='CROSSING')
    {
      return Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: AppConstant.greyBoxDecoration,
          child: ExpansionTile(



            collapsedShape: InputBorder.none,
            shape: InputBorder.none,


            dense: false,
            initiallyExpanded: initExpand,
            visualDensity: VisualDensity(horizontal: 0),

            // expansionAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 500),curve: Curves.bounceOut,reverseCurve: Curves.linear),

            subtitle: Text('${data.type}',style: TextStyle(
                fontWeight: FontWeight.w600
            ),),


            title: Text('${data.battingGameId?.name??'Unknown'}',style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppConstant.themYellow
            ),),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [


                if(data.createdAt!=null)
                  Text('${CustomFormat().formatTime(data.createdAt!.add(Duration(minutes: 330)))}',
                    style: TextStyle(
                        fontSize: SC.from_width(10,),
                        fontWeight: FontWeight.w400
                    ),),

                if(data.createdAt!=null)
                  Text('${CustomFormat().formatDate(data.createdAt!.add(Duration(minutes: 330)))}',
                    style: TextStyle(
                        fontSize: SC.from_width(10,),
                        fontWeight: FontWeight.w400
                    ),),

                Text('Total Amount : ${data.crossingTotalAmount??'0'}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: SC.from_width(15),
                      color: AppConstant.themYellow
                  ),),


              ],
            ),



            children: [

              Table(
                children: [


                  TableRow(
                      decoration: BoxDecoration(
                          color: AppConstant.themYellow
                      ),
                      children:[
                        Center(child: Text('Betting Number',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),

                        //
                        Center(child: Text('Amount',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),

                        //
                        Center(child: Text('Status',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),


                      ]
                  ),

                  for(Crossing i in data.crossing??[])
                    TableRow(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${i.crossingNum}',style: TextStyle(

                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),

                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${(i.status=="LOST"?'-':(i.status=="WON")?'+':'')}${i.crossingAmount}',style: TextStyle(
                              color: (i.status=="LOST"?Colors.red:(i.status=="WON")?Colors.green:null),
                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),

                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${i.status}',style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          )
                        ]
                    )
                ],
              ),


              // if(kDebugMode)
              //   Text("${data.toJson()}")
            ],

          ));
    }

    //
    if(data.type=='HARUF')
    {
      return Container(
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: AppConstant.greyBoxDecoration,
          child: ExpansionTile(



            collapsedShape: InputBorder.none,
            shape: InputBorder.none,


            dense: false,
            initiallyExpanded: initExpand,
            visualDensity: VisualDensity(horizontal: 0),

            // expansionAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 500),curve: Curves.bounceOut,reverseCurve: Curves.linear),

            subtitle: Text('${data.type}',style: TextStyle(
                fontWeight: FontWeight.w600
            ),),


            title: Text('${data.battingGameId?.name??'Unknown'}',style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppConstant.themYellow
            ),),

            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [


                if(data.createdAt!=null)
                  Text('${CustomFormat().formatTime(data.createdAt!.add(Duration(minutes: 330)))}',
                    style: TextStyle(
                        fontSize: SC.from_width(10,),
                        fontWeight: FontWeight.w400
                    ),),

                if(data.createdAt!=null)
                  Text('${CustomFormat().formatDate(data.createdAt!.add(Duration(minutes: 330)))}',
                    style: TextStyle(
                        fontSize: SC.from_width(10,),
                        fontWeight: FontWeight.w400
                    ),),

                Text('Total Amount : ${data.harufTotalAmount}',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: SC.from_width(15),
                      color: AppConstant.themYellow
                  ),),


              ],
            ),



            children: [

              Table(
                children: [


                  TableRow(
                      decoration: BoxDecoration(
                          color: AppConstant.themYellow
                      ),
                      children:[
                        Center(child: Text('Ander Game Number',
                          textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),

                        //
                        Center(child: Text('Amount',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),

                        Center(child: Text('Status',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),
                      ]
                  ),

                  for(ArGame i in data?.haruf![0]?.andarGame??[])
                    TableRow(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${i.game}',style: TextStyle(

                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),

                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${(i.status=="LOST"?'-':(i.status=="WON")?'+':'')}${i.harufAmount}',style: TextStyle(
                              color: (i.status=="LOST"?Colors.red:(i.status=="WON")?Colors.green:null),
                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),

                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${i.status}',style: TextStyle(

                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),
                        ]
                    )
                ],
              ),
              
              
              SizedBox(height: SC.from_width(10),),

              Table(
                children: [


                  TableRow(
                      decoration: BoxDecoration(
                          color: AppConstant.themYellow
                      ),
                      children:[

                        //
                        Center(child: Text('Bahar Game Number',

                          textAlign: TextAlign.center,
                          style:

                        TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),
                        //

                        //
                        Center(child: Text('Amount',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),)),


                        //
                        Center(child: Text('Status',style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: SC.from_width(14)
                        ),))
                      ]
                  ),

                

                  for(ArGame i in data?.haruf![0]?.baharGame??[])
                    TableRow(
                        children:[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${i.game}',style: TextStyle(

                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),

                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${(i.status=="LOST"?'-':(i.status=="WON")?'+':'')}${i.harufAmount}',style: TextStyle(
                              color: (i.status=="LOST"?Colors.red:(i.status=="WON")?Colors.green:null),
                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),


                          //
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(child: Text('${i.status}',style: TextStyle(

                                fontWeight: FontWeight.w700,
                                fontSize: SC.from_width(14)
                            ))),
                          ),
                        ]
                    )
                ],
              )


              // if(kDebugMode)
              //   Text("${data.toJson()}")
            ],

          ));
    }
    
    return Container(
      decoration: AppConstant.greyBoxDecoration,
      child: InkWell(
        onLongPress: ()
          {
            if(kDebugMode)
              {
                OpenDailovgWithAnimation(context, dailog: Center(child: Card(child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text('${data.toJson()}'),
                ),)));

              }
          },
          child: Card(child: Text('${data.toJson()}'))),
    );
    
  }
}
