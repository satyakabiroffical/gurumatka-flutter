import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

class MyMatchTileLive extends StatelessWidget {
  const MyMatchTileLive({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: SC.from_width(13),
          bottom: SC.from_width(12),
          right: SC.from_width(16)
      ),
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: AppConstant.themYellow
          )
      ),

      child:Row(
        children: [
          Container(
            height: SC.from_width(110),
            width: SC.from_width(5),
            decoration: BoxDecoration(
                color: AppConstant.themYellow,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6),
                  bottomRight : Radius.circular(6),
                )
            ),
          ),

          //
          Container(
            height: SC.from_width(106),
            width: SC.from_width(106),
            margin: EdgeInsets.only(
              right: SC.from_width(20),
              left: SC.from_width(7),
            ),
            decoration: BoxDecoration(
              color: AppConstant.themYellow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(AIcon.crown),
          ),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //
                Text("Delhi",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SC.from_width(16),
                  ),),

                //
                Text("3444 people are playing",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(12)
                  ),),

                //background: rgba(108, 189, 66, 1);
                Container(
                  alignment: AlignmentDirectional.center,
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    top: SC.from_width(4)
                  ),
                  height: SC.from_width(17),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color.fromRGBO(108, 189, 66, 1)
                  ),
                  child: Text("Live"
                  ,style: TextStyle(
                      fontWeight: FontWeight.w700
                    ),),
                ),

                


              ],),
          ),


          //

        ],
      ),
    );
  }
}
