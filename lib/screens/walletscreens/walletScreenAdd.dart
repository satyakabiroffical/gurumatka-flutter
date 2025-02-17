import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/Controllers/transection%20provider.dart';
import 'package:guru_matka_new/Controllers/walletController.dart';
import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenWinning.dart';
import 'package:provider/provider.dart';

class WalletScreenAdd extends StatefulWidget {
  const WalletScreenAdd({super.key});

  @override
  State<WalletScreenAdd> createState() => _WalletScreenAddState();
}

class _WalletScreenAddState extends State<WalletScreenAdd> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<WalletProvider>(context, listen: false).getQR(context);
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Provider.of<WalletProvider>(context, listen: false).clear();
        Provider.of<TransectionProvider>(context, listen: false).clearFields();
        return true;
      },
      child: BackGround(
        child: Scaffold(


          //
          appBar: AppBar(
            leading: SizedBox(),
            title: Text("UPI Barcode"),
          ),

          body: Consumer<TransectionProvider>(
            builder: (context, p, child) {


              return Form(
                key: formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  children: [
                    //Barcode
                    Consumer<WalletProvider>(builder: (context, v, child) => Column(
                      children: [

                        //
                        Padding(
                          padding: EdgeInsets.only(
                            top: SC.from_width(15),
                            bottom: SC.from_width(9),

                            //assets/icons/barcode.png
                          ),
                          child: Center(
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              height: SC.from_width(204),
                              width: SC.from_width(204),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                              child: v.loadingWallet?Center(child: CupertinoActivityIndicator(),):Image.network("${MyUrl.bucketUrl}${v.walletData?.data?.qrCode}",fit: BoxFit.cover,),
                            ),
                          ),
                        ),

                        //
                        Container(
                          margin: EdgeInsets.only(
                              top: SC.from_width(19), bottom: SC.from_width(23)),
                          height: SC.from_width(54),
                          width: double.infinity,
                          decoration: AppConstant.greyBoxDecoration,
                          child: Row(
                            children: [
                              SizedBox(
                                width: SC.from_width(15),
                              ),
                              //
                              Text(
                                "${v.walletData?.data?.upiId}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: SC.from_width(16)),
                              ),

                              Spacer(),

                              IconButton(
                                  onPressed: () {

                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    color: AppConstant.themYellow,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),),

                    //
                    Center(
                      child: Text(
                        "यहां पर QR देख कर ही पेमेंट करे। यहां QR बदलते रहते है।",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SC.from_width(12)),
                      ),
                    ),




                    //
                    TextFormField(
                      controller: p.tIdController,
                      decoration: InputDecoration(
                        hintText: "Transaction-ID/UTR-No",
                      ),
                      validator: (value) {
                        if(value?.isEmpty==true)
                          {
                            return 'Enter Transection Id';
                          }
                      },
                    ),
                    SizedBox(
                      height: SC.from_width(23),
                    ),

                    //
                    TextFormField(
                      controller: p.ammuntController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      validator: (s) {
                        if (s!.isEmpty) {
                          return "Enter Amount";
                        }
                      },
                      decoration: InputDecoration(hintText: 'Enter Amount'),
                    ),
                    SizedBox(
                      height: SC.from_width(6),
                    ),

                    //
                    Center(
                      child: Text(
                        'यहाँ UTR नंबर डाले',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: SC.from_width(12)),
                      ),
                    ),
                    SizedBox(
                      height: SC.from_width(20),
                    ),

                    //
                    Ink(
                      decoration: AppConstant.greyBoxDecoration,
                      height: SC.from_width(166),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {
                            p.selectScreeShot(context);
                          },
                          child: (p.screenShot!=null)?Image.file(File(p.screenShot!),fit: BoxFit.cover,):Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.image,
                                size: SC.from_width(76),
                              ),
                              Text(
                                "Payment का स्क्रीनशाट यहा ढाले",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: SC.from_width(12)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: SC.from_width(25),
                    ),

                    CustomButton(
                        onTap: () {
                          if(p.screenShot==null){
                            showMessage(context, "Upload Screen Shot");
                          }
                          if (formKey.currentState?.validate() == true&&p.screenShot!=null) {
                            p.addAmmount(context);
                          }
                        },
                        title: "Submit"),

                    if(kDebugMode)
                      ElevatedButton(onPressed: (){
                        p.clear();
                      }, child: Text("clear")),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
