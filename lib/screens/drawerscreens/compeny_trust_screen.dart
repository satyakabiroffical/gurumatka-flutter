import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:guru_matka_new/Controllers/auth_controller.dart';
import 'package:guru_matka_new/apiService/LogInAPi.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/models/get_conpany_model.dart';
import 'package:provider/provider.dart';



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
        body: Consumer<AuthProvider>(builder: (context, p, child) {

          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(10),
              decoration: AppConstant.greyBoxDecoration,
              child: HtmlWidget('${p.company?.data?.companyTrustProfile??''}'),),
          );
          
        },),
      ),
    );
  }
}
