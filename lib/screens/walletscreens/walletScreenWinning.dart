import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/component/rateText.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/walletscreens/DipositHistoryScreen.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenAdd.dart';
import 'package:guru_matka_new/screens/walletscreens/widrawHisteryScreen.dart';
import 'package:guru_matka_new/screens/walletscreens/widrawScreen.dart';
import 'package:provider/provider.dart';

import '../../daimention/daimentio n.dart';


class WalletScreenMain extends StatelessWidget {
   WalletScreenMain({super.key});


  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(

        //
        appBar: AppBar(
          leading: SizedBox(),
          title: Text("Wallet"),
        ),

        //
        body: Consumer<ProfileProvider>(
          builder: (context, p, child) =>  ListView(
            padding: EdgeInsets.all(20),
            children: [

              //
              Container(
                height: SC.from_width(215),
                margin: EdgeInsets.only(
                    bottom: SC.from_width(37)
                ),
                width: double.infinity,
                decoration: AppConstant.greyBoxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    //
                    Text("Total Balance",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SC.from_width(16)
                      ),),

                    //
                    Row(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("₹",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: SC.from_width(30)
                          ),),
                        Text("${p.user?.walletBalance??'0'}",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: SC.from_width(57)
                          ),)
                      ],
                    ),

                    Container(
                      alignment: AlignmentDirectional.center,
                      height: SC.from_width(28),
                      width: SC.from_width(158),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(76, 176, 80, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text('100% Safe & Secure',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SC.from_width(14)
                        ),),
                    )

                  ],
                ),
              ),

              //


              //
              Row(children: [

                //
                Expanded(child: AspectRatio(aspectRatio: 1,child: Container(
                  height: SC.from_width(92),
                  decoration: AppConstant.greyBoxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      RateText(data: '7'),

                      Text("Deposit",style: TextStyle(fontWeight: FontWeight.w400,fontSize: SC.from_width(14)),)

                    ],
                  ),
                ),)),
                SizedBox(width: SC.from_width(16),),

                //
                Expanded(child: AspectRatio(aspectRatio: 1,child: Container(
                    height: SC.from_width(92),
                    decoration: AppConstant.greyBoxDecoration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        RateText(data: '100'),

                        Text("Bonus",style: TextStyle(fontWeight: FontWeight.w400,fontSize: SC.from_width(14)),)

                      ],
                    )
                ),)),
                SizedBox(width: SC.from_width(16),),

                //
                Expanded(child: AspectRatio(aspectRatio: 1,child: Container(
                  height: SC.from_width(92),
                  decoration: AppConstant.greyBoxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      RateText(data: '${p.user?.totalCommission??'0'}'),

                      Text("Commission",style: TextStyle(fontWeight: FontWeight.w400,fontSize: SC.from_width(14)),)

                    ],
                  ),


                ),)),


              ],),
              SizedBox(height: SC.from_width(35),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  SizedBox(
                      width: SC.from_width(149),
                      child: CustomButton(
                        onTap: (){
                          RouteTo(context, child:(p0, p1) => WalletScreenAdd(),);
                        },
                        title: "ADD",
                      )),

                  SizedBox(
                      width: SC.from_width(149),
                      child: CustomButton2(
                        onTap: (){
                          RouteTo(context, child: (p0, p1) =>WidrawScreen(),);
                        },
                        title: "WITHDRAW",
                      ))



                ],
              ),
              SizedBox(height: SC.from_width(32),),

              CustomButton2(
                  onTap: (){
                    RouteTo(context, child: (p0, p1) => DipositHistoryScreen(),);
                  },
                  title: "Deposit History"),

              SizedBox(height: SC.from_width(15),),

              CustomButton2(
                  onTap: (){
                    RouteTo(context, child: (p0, p1) => WithdrawHistoryScreen(),);
                  },
                  title: "Withdraw History")

            ],
          ),
        ),
      ),
    );
  }
}
