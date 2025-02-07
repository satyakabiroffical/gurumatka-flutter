import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';



class CompenyTrustScreen extends StatelessWidget {
  const CompenyTrustScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      
      child: Scaffold(

        //
        appBar: AppBar(
          title: Text("Company trust Profile"),
        ),

        //
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(

            children: [


              Container(
                padding: EdgeInsets.all(12),
                decoration: AppConstant.greyBoxDecoration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Text('COMPANY PROFILE',style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize:SC.from_width(14)
                  ),),

                  //
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(14)
                    ),
                    horizontalTitleGap: 5,
                    leading: Icon(Icons.arrow_forward_ios),
                    title: Text('The company will keep all your information safe. '),
                  ),


                  //
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SC.from_width(14)
                      ),
                      horizontalTitleGap: 5,
                      leading: Icon(Icons.arrow_forward_ios),
                      title: Text('You can join the company without thinking, the company will not do any fraudulent work with you'),
                    ),


                    //
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      titleTextStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: SC.from_width(14)
                      ),
                      horizontalTitleGap: 5,
                      leading: Icon(Icons.arrow_forward_ios),
                      title: Text('The company will respect your work and stay connected with you as a true friend. '),
                    ),
                  SizedBox(height: SC.from_width(30),)




                  //


                ],),
              )

            ],
          ),
        ),
      ),
    );
  }
}
