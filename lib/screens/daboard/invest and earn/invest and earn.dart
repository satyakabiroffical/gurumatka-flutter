import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';



class ShearAndEarnScreen extends StatelessWidget {
  const ShearAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Invite & Earn"),
      ),


      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: 20
        ),

        children: [

          //Amount Card
          Container(
            margin: EdgeInsets.only(top: SC.from_width(27)),
            height: SC.from_width(160),
            width: double.infinity,
            decoration:AppConstant.greyBoxDecoration,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
              children: [

                //
                Text("Commission",
                style: TextStyle(
                  fontSize: SC.from_width(24),
                  fontWeight: FontWeight.w400
                ),),


                //Rupees
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
                )
              ],
            ),
          ),

          //
          Padding(
            padding: EdgeInsets.only(
              top: SC.from_width(24),
              bottom: SC.from_width(21)
            ),
            child: CustomButton(title: "EXCHANGE"),
          ),

          //
          Container(
            height: SC.from_width(49),
            width: double.infinity,
            decoration: AppConstant.greyBoxDecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  //
                  Text("Total people Added",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SC.from_width(14)
                  ),),

                  //
                  Text("0",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SC.from_width(14)
                    ),),


                ],
              ),
            ),

          ),

          //
          Padding(
            padding: EdgeInsets.only(
              top: SC.from_width(31),
              bottom: SC.from_width(12)

            ),
            child: Text('Your referral code',
            style: TextStyle(
              fontSize: SC.from_width(14),
              fontWeight: FontWeight.w400,
            ),),
          ),

          //
          Row(
            children: [

              //
              Expanded(
                child: DottedBorder(
                  strokeWidth: 1,
                  dashPattern: [8],
                  color: AppConstant.themYellow,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(50),
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 50,width: double.infinity,
                  child: Text('354hdu32832',
                  style: TextStyle(
                    fontSize: SC.from_width(14),
                    fontWeight: FontWeight.w400,
                  ),),),
                ),
              ),

              //
              Container(
                margin: EdgeInsets.only(
                  left: SC.from_width(11)
                ),
                height: SC.from_width(50),
                width: SC.from_width(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(250, 225, 180, 1),
                    Color.fromRGBO(242, 177, 55, 1)
                  ])
                ),
                child: IconButton(onPressed: (){},
                    icon:Icon(Icons.copy,color: Colors.black,)),
              )
            ],
          ),
          SizedBox(height: SC.from_width(60),),

          //share Button
          CustomButton(title: "Send Friends")



        ],
      ),
    );
  }
}
