import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/joidiModel.dart';


class JodiWidget extends StatelessWidget {
  final bool selected;
  final JodiModel? jodi;
  final void Function()? onTap;
  final int number;
  const JodiWidget({this.jodi,this.selected=false,required this.number,this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return   Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Stack(
        children: [

          //
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Ink(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black
                    ),


                    gradient:(selected)?
                    LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                        colors: [
                      AppConstant.themYellow,
                      AppConstant.themYellow,
                      Colors.white
                    ]):
                    LinearGradient(colors: [
                      Colors.grey.shade900,
                      Color.fromRGBO(19, 19, 22, 1)
                    ]),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: InkWell(
                    onTap: onTap,
                    child: Center(
                        child: Padding(
                          padding:  EdgeInsets.only(bottom: (selected)?SC.from_width(6):0),
                          child: Text('${number.toString().padLeft(2,'0')}'
                                                ,style: TextStyle(
                          color: selected ?Colors.black:Colors.white,
                          fontWeight: FontWeight.w600
                                                ),),
                        )))),
          ),
          
          
          if(selected)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                height: SC.from_width(18),
                child: Text("₹ ${jodi?.amount??0}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: SC.from_width(10)
                ),),
              ),
            ),


        ],
      ),
    );
  }
}
