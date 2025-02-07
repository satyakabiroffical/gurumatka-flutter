import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomFeild.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/walletscreens/widrawHisteryScreen.dart';


class WidrawScreen extends StatelessWidget {
  const WidrawScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(

        //
        appBar: AppBar(
            title: Text('Withdraw cash'),
        ),

        //
        body: ListView(
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
                  Text("Winning Balance",
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

                  //
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
                  ),

                  //



                  

                ],
              ),
            ),

            //
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              child: Column(
                children: [

                  //Number
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SC.from_width(19),
                    ),
                    child: CustomFeild(
                        label: "Enter Amount",
                    ),
                  ),

                  //Bank Name
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SC.from_width(19),
                    ),
                    child: CustomFeild(
                      label: "Bank Name",
                    ),
                  ),

                  //Account Number
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SC.from_width(19),
                    ),
                    child: CustomFeild(
                      inputType: TextInputType.number,
                      label: "Bank account number",
                      formatters: [
                        LengthLimitingTextInputFormatter(16)
                      ],
                    ),
                  ),

                  //Name
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SC.from_width(19),
                    ),
                    child: CustomFeild(
                      label: "Name",
                    ),
                  ),

                  //Mobile Number
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SC.from_width(19),
                    ),
                    child: CustomFeild(
                      inputType: TextInputType.number,
                      formatters: [
                        LengthLimitingTextInputFormatter(10)
                      ],
                      label: "Mobile number",
                    ),
                  ),

                  //IfscCode
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: SC.from_width(0),
                    ),
                    child: CustomFeild(
                      label: "IFSC Code",
                    ),
                  ),





                ],
              ),
            ),
            SizedBox(
              height: SC.from_width(25),
            ),

            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: SC.from_width(154),
                    child: CustomButton2(color: Colors.black,title: "Withdraw")
                ),

                //
                SizedBox(
                  width: SC.from_width(154),
                    child: CustomButton2(
                      onTap: () {
                        RouteTo(context, child: (p0, p1) => WithdrawHistoryScreen(),);
                      },
                        title: "Withdraw History")
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
