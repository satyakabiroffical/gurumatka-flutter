import 'package:flutter/material.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';

import '../../../component/AppConstent.dart';

class HarufResultWidget extends StatelessWidget {
  final Map data;
  const HarufResultWidget({required this.data,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: AppConstant.greyBoxDecoration,
      child:  Column(
        children: [

          Container(
            padding: EdgeInsets.all(1),
            color: Colors.black,
            child:Row(
            children: [

              //
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: SC.from_width(8)),

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8)
                    )
                  ),
                  child: Text("Andar Game"),
                ),
              ),
              SizedBox(width: 1,),

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: SC.from_width(8)),

                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8)
                      )
                  ),
                  child: Text("Bahar Game"),
                ),
              )


              //
            ],
          ),),

          for(int i = 0;i<10;i++)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [

                  Expanded(child:(data["A${i}"]!=null&&data["A${i}"].isNotEmpty)? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        //
                        Expanded(child: Center(child: Text("A${i}"))),

                        Expanded(child: Center(child: Text("${data["A${i}"]??''}")))

                      ],
                    ),
                  ):SizedBox()),

                  Expanded(child:data["B${i}"]!=null&&data["B${i}"].isNotEmpty? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        //
                        Expanded(child: Center(child: Text("B${i}"))),

                        //
                        Expanded(child: Center(child: Text("${data["B${i}"]??''}")))

                      ],
                    ),
                  ):SizedBox())
                ],
              ),
            ),
          //

          SizedBox(height: SC.from_width(5),)


        ],
      ),
    );
  }
}
