import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/game%20provider.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/jodi_widget.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/gameModel.dart';
import 'package:provider/provider.dart';


class GameTab1 extends StatelessWidget {
  final Game? game;
  const GameTab1({required this.game,super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, p, child) => Stack(
        children: [
          //
          ListView(
            children: [

              if(kDebugMode)
                Text("${p.gameInfo?.minAmount}  -  ${p.gameInfo?.maxAmount}"),
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

                  return JodiWidget(
                    jodi: p.getJodi(index),
                    selected: p.isNumberIsSelected(index),
                    number: index,
                      onTap: (){
                      if(p.isNumberIsSelected(index))
                        {
                          p.removeNumber(index);
                        }
                      else
                        {
                          p.selectNumber(context, index);
                        }

                      }
                  );
                },

              ),


              ListTile(),

              //
              SizedBox(height: SC.from_width(30),),

            ],
          ),


          //
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(16) ,
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
                subtitle: Text('${p.totalAmount()}'),

                //
                trailing: SizedBox(
                    width: SC.from_width(88),
                    height: SC.from_width(34),
                    child: CustomButton(
                        onTap: (){
                          p.submitJodiBet(context,game?.id??'');
                        },
                        title: "Submit")),
              ),

            ),
          )

        ],
      ),

    );
  }
}
