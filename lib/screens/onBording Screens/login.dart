import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/AuthField.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/CustomSlideAnimation.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/onBording%20Screens/Otp.dart';



class LoginScreen extends StatelessWidget {
  final Animation animation;
  const LoginScreen({required this.animation,super.key});

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
        bottomSheet: Container(

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
                Text("Login/Register",
                  style:AppConstant().largeWhitText(),
                ),
                SizedBox(height: SC.from_width(8),),

                //
                Text(
                  'Enter your mobile number',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: SC.from_width(14),
                  fontWeight: FontWeight.w400
                ),),
                SizedBox(height: SC.from_width(21),),

                
                //
                MySlideTr(
                  animation: animation,
                  curve: Curves.easeOut,
                  startPosition: Offset(1, 0),
                  intervel: 0,
                  endInterver: 1,
                  child: AuthField(
                    keyBoardtype: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    prefix: SizedBox(
                      height: SC.from_width(50),
                      child: AspectRatio(
                        aspectRatio: 1,
                          child: Center(child: Text('+91',style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: SC.from_width(14)),))),
                    ),
                    hintText: "Enter Mobile Number",
                  ),
                ),

                SizedBox(height: SC.from_width(34),),
                
                //
                MySlideTr(
                  animation: animation,
                  curve: Curves.easeIn,
                  intervel: 0,
                  endInterver: 1,
                  startPosition: Offset(1, 0),
                  child: CustomButton(
                    onTap: (){
                      RouteTo(context, child: (p0, p1) => OtpScreen(animation: p0,),);
                    },
                      title: "Next"
                  ),
                ),
                


              ],
            ),
          ),

        ),
      ),
    );
  }
}
