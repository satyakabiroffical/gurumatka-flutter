import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenAdd.dart';


class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
      
        //
        appBar: AppBar(
          title: Text("Wallet"),
        ),
      
      
        //
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: SC.from_width(31),),

              //Amount section
              Container(
                height: SC.from_width(215),
                width: double.infinity,
                decoration: AppConstant.greyBoxDecoration,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    //
                    Text("Enter Amount",
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
                        Text("0",
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

              //Note
              Padding(
                padding: EdgeInsets.only(
                  top: SC.from_width(18),
                  left: SC.from_width(10),
                  right: SC.from_width(10),
                  bottom: SC.from_width(35),
                ),
                child: Text('Note: न्यूनतम राशि 200 और अधिकतम राशि 25000 है',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SC.from_width(16)
                ),),
              ),

              //Add Button
              CustomButton(
                onTap: (){
                  RouteTo(context, child: (p0, p1) => WalletScreenAdd(),);
                },
                  title: 'Add Now'),
              SizedBox(height: SC.from_width(81),),

              //
              Container(
                height: SC.from_width(76),
                decoration: AppConstant.greyBoxDecoration,
                child:Row(
                  children: [
                    
                    //
                    AspectRatio(
                      aspectRatio: 1,
                        child: Image.asset(AIcon.whatsApp)),
                    SizedBox(width: SC.from_width(5),),
                    
                    //
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          //
                          Text("+91 0011223344",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SC.from_width(16)
                          ),),
                          
                          //
                          Text("Whatsapp",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: SC.from_width(15)
                          ),),
                      
                          
                        ],
                      ),
                    ),


                    //
                    Image.asset(AIcon.clickGesture,
                    height: SC.from_width(53),)

                  ],
                ),
              )




            ],
          ),
        ),
      ),
    );
  }
}
