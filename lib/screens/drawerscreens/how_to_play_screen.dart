import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/apiService/otherApi.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/how_to_play.dart';


class HowToPlayScreen extends StatelessWidget {
  const HowToPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(
        appBar: AppBar(
          
          title: Text("How To Play"),
          
        ),
        
        body: FutureBuilder(future: OtherApi().howToPlay(), builder: (context, snapshot){

          //
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator());
            }

          //
          if(snapshot.hasError)
            {
              return Center(child: Text("Error : ${snapshot.error}"),);
            }

          //
          if(snapshot.data!=null)
            {
              var resp = snapshot.data;

              if(resp!.statusCode==200)
                {
                  var _data = howToPlayFromJson(resp.body);

                  return SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(10),
                        decoration: AppConstant.greyBoxDecoration,
                    child: HtmlWidget(_data.data?.description??''),),
                  );
                }

            }


          //
          return Center(
            child: HtmlWidget(snapshot.data?.body??''),
          );

        },),
      ),
    );
  }
}
