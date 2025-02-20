import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/AuthField.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/CustomSlideAnimation.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/actionButton.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/animated%20dilog.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/daboard/navigation%20screens.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';



class OtpScreen extends StatelessWidget {
  final Animation animation;
  const OtpScreen({required this.animation,super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(



        //
        body: Center(
          heightFactor: 1.9,
          child: Image.asset("assets/mainImage/splashScreenLogo.png",width: SC.from_width(190),),
        ),

        //
        bottomSheet: Consumer<AuthProvider>(builder: (context, p, child) => Container(

          height: SC.from_width(470),
          decoration: BoxDecoration(
              color: Colors.black,

              borderRadius: BorderRadius.only(

                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),

              )
          ),


          child: Padding(

            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SC.from_width(28),),

                //
                Text("Verify Mobile Number",
                  style:AppConstant().largeWhitText(),
                ),
                SizedBox(height: SC.from_width(8),),

                //
                Text('We have send a code to your number',style: TextStyle(
                    color: Colors.white,
                    fontSize: SC.from_width(14),
                    fontWeight: FontWeight.w400
                ),),
                SizedBox(height: SC.from_width(21),),


                //
                Center(
                  child: MySlideTr(
                    animation: animation,
                    curve: Curves.easeOut,
                    startPosition: Offset(1, 0),
                    child: Pinput(
                      //
                      controller: p.otpController,

                      //
                      closeKeyboardWhenCompleted: true,

                      //
                      defaultPinTheme: PinTheme(
                          width: SC.from_width(64),
                          height: SC.from_width(64),

                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SC.from_width(16)
                          ),

                          //
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors:[
                                    Colors.black,

                                    Colors.grey.withOpacity(.1),
                                  ]
                              ),

                              //
                              borderRadius: BorderRadius.circular(8),

                              //
                              border: Border.all(
                                  color: Colors.grey
                              )
                          )
                      ),

                      //
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      //


                      //
                      onCompleted: (s)
                      {
                        log(s);
                      },


                    ),
                  ),
                ),
                SizedBox(height: SC.from_width(34),),
                Center(
                  child: MySlideTr(
                    animation: animation,
                    curve: Curves.easeOut,
                    startPosition: Offset(1, 0),
                    child: AuthField(
                      controller: p.refCodeController,
                      hintText: 'Reference Codes',
                    ),
                  ),
                ),
                SizedBox(height: SC.from_width(34),),

                //
                MySlideTr(
                  animation: animation,
                  curve: Curves.easeIn,
                  child: Center(
                    child: MyactionButton(
                        action: ()=> p.verifyOtp(context),
                        lable: "Submit Now"
                    ),
                  ),
                ),



              ],
            ),
          ),

        ),),
      ),
    );
  }
}
