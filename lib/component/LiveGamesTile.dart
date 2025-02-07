import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/appIcons.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/GamsScreens/GameTabScreen.dart';

class LiveGameTile extends StatelessWidget {
  const LiveGameTile({super.key});

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
            height: SC.from_width(67),
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
          padding: EdgeInsets.symmetric(horizontal: 5),
            height: SC.from_width(59),
            width: SC.from_width(59),
            margin: EdgeInsets.only(
              right: SC.from_width(5),
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
                Text("Gaziabad",
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

                //
                Container(
                  alignment: Alignment.center,
                  
                  margin: EdgeInsets.only(
                    top: SC.from_width(5)
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(2)
                  ),
                  
                  width: SC.from_width(130),
                  child: Text("Open",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: SC.from_width(12)
                  ),),
                )
                


              ],),
          ),



          Card(
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            ),
            child: Ink(
            
              height: SC.from_width(55),
              width: SC.from_width(55),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                gradient: LinearGradient(
            
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
            
                    colors:[
            
                      //
                      Color.fromRGBO(1 , 1 , 0, 1),
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(27, 22, 14, 1),
            
            
                    ]),
              ),
            
              child: InkWell(
                onTap: (){
                  RouteTo(context, child: (p0, p1) => GameTabScreen(),);
                },
                  child: Center(child: Icon(Icons.play_arrow_rounded,size: SC.from_width(30),))),
            ),
          )

          //

        ],
      ),
    );
  }
}
