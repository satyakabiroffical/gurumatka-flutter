import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class WithdrawHistoryTile extends StatelessWidget {
  const WithdrawHistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(SC.from_width(10)),
      decoration: AppConstant.greyBoxDecoration,
      height: SC.from_width(93),
      child:Row(
        children: [

          //
          Container(
            margin: EdgeInsets.only(right: SC.from_width(12)),
            width: SC.from_width(51),
            height: SC.from_width(51),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppConstant.buttonDecoration.gradient
            ),
            child: Center(child: Image.asset("assets/icons/walletLogo.png",width: SC.from_width(23),)),
          ),

          //
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //
              Text("Withdraw",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(14)
              ),),


              //
              Text("Winning",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: SC.from_width(12)
              ),),
            
            ],),
          ),

          //
          SizedBox(
            width: SC.from_width(130),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //
                Text("-20 ₹",
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SC.from_width(16),
                  color: AppConstant.themYellow
                ),),

                //
                Text("07: 01 PM",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SC.from_width(12),
                ),),

                //
                Text("January 29, 2025",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(12),
                    )),

              ],
            ),
          )


        ],
      ),
    );
  }
}
