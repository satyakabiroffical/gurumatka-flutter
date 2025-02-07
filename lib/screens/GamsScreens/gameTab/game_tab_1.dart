import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';


class GameTab1 extends StatelessWidget {
  const GameTab1({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        GridView.builder(
          primary: false,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          itemCount: 100,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            crossAxisSpacing: SC.from_width(8),
            mainAxisSpacing: SC.from_width(8),
          ),
          itemBuilder: (context, index) {

            return Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
              ),
              child: Ink(

                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromRGBO(0, 0, 0, 1),
                      Color.fromRGBO(19, 19, 22, 1)
                    ]),
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child: InkWell(
                    onTap: (){},
                      child: Center(child: Text('${index}'
                      ,style: TextStyle(

                        ),)))),
            );
          },

        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16,) ,
          decoration:AppConstant.greyBoxDecoration,
          child: ListTile(

            //
            title: Text("Total Amount"),
            titleTextStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: SC.from_width(14)
            ),

            subtitleTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(16)
            ),
            //
            subtitle: Text('0'),

            //
            trailing: SizedBox(
              width: SC.from_width(88),
              height: SC.from_width(34),
                child: CustomButton(title: "Submit")),
          ),
          
        ),
        SizedBox(height: SC.from_width(30),),

      ],
    );
  }
}
