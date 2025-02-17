import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/Controllers/walletController.dart';
import 'package:guru_matka_new/Controllers/withdrawProvider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomFeild.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/custom_button_2.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/walletscreens/widrawHisteryScreen.dart';
import 'package:provider/provider.dart';


class WidrawScreen extends StatefulWidget {
  WidrawScreen({super.key});

  @override
  State<WidrawScreen> createState() => _WidrawScreenState();
}

class _WidrawScreenState extends State<WidrawScreen> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {


    return WillPopScope(

      //
      onWillPop: ()async{

        Provider.of<WithdrawProvider>(context,listen: false).clearTextControllers();

        return true;

      },
      //
      child: BackGround(
        child: Scaffold(

          //
          appBar: AppBar(
              title: Text('Withdraw cash'),
          ),

          //
          body: Form(
            key: formKey,
            child: Consumer<WithdrawProvider>(builder: (context, p, child) => ListView(
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
                          Text("${Provider.of<ProfileProvider>(context,listen: false).user?.walletBalance??'0'}",
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

                         controller:  p.ammountController,

                          //
                          validator: (d){
                            if(d!.isEmpty)
                            {
                              return "Enter Amount";
                            }
                          },

                          //
                          inputType: TextInputType.number,

                          formatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          label: "Enter Amount",
                        ),
                      ),

                      //Bank Name
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: SC.from_width(19),
                        ),
                        child: CustomFeild(

                          //
                          controller: p.bankNameController,
                          //
                          validator: (d){
                            if(d!.isEmpty)
                            {
                              return "Enter Bank Name";
                            }
                          },
                          //

                          label: "Bank Name",
                        ),
                      ),

                      //Account Number
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: SC.from_width(19),
                        ),
                        child: CustomFeild(

                          //
                          controller: p.accountNumberController,
                          validator: (d){
                            if(d!.isEmpty)
                            {
                              return "Enter BankAccount Number";
                            }
                          },

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

                          controller: p.holderNameController,

                          validator: (d){
                            if(d!.isEmpty)
                            {
                              return "Enter Name";
                            }
                          },
                          label: "Name",
                        ),
                      ),

                      //Mobile Number
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: SC.from_width(19),
                        ),
                        child: CustomFeild(

                          controller: p.mobileNumberController,

                          validator: (d){
                            if(d!.isEmpty)
                            {
                              return "Enter Mobile Number";
                            }
                            else if(d.length<10)
                            {
                              return 'Invalid Mobile Number';
                            }
                          },
                          inputType: TextInputType.number,
                          formatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly
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

                          //
                          controller: p.ifscCodeController,
                          //
                          validator: (d){
                            if(d!.isEmpty)
                            {
                              return "Enter IFSC Code";
                            }
                          },
                          //
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
                        child: CustomButton2(
                            onTap: (){
                              if(formKey.currentState!.validate())
                              {
                                p.createWithdraw(context);
                              }
                            },
                            color: Colors.black,title: "Withdraw")
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
            ),),
          ),
        ),
      ),
    );
  }
}
