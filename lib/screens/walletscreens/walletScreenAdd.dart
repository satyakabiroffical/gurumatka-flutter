import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/AppConstent.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:guru_matka_new/my%20custom%20assets%20dart%20file/myast%20dart%20file.dart';
import 'package:guru_matka_new/screens/walletscreens/walletScreenWinning.dart';

class WalletScreenAdd extends StatelessWidget {
  const WalletScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(

        //
        appBar: AppBar(
          leading: SizedBox(),
          title: Text("UPI Barcode"),
        ),


        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20 ),
          children: [

            //Barcode
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
                      color: Colors.white
                    ),
                  child: Image.asset('assets/icons/barcode.png'),
                ),
              ),
            ),

            //
            Center(
              child: Text("यहां पर QR देख कर ही पेमेंट करे। यहां QR बदलते रहते है।",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(12)
              ),),
            ),

            //
            Container(
              margin: EdgeInsets.only(
                  top:SC.from_width(19),
                bottom: SC.from_width(23)
              ),
              height: SC.from_width(54),
              width: double.infinity,
              decoration: AppConstant.greyBoxDecoration,
              child: Row(

                children: [
                  SizedBox(width: SC.from_width(15),),
                  //
                  Text("910011223344@Okgvhg",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SC.from_width(16)
                  ),),

                  Spacer(),

                  IconButton(onPressed: (){}, icon: Icon(Icons.copy,color: AppConstant.themYellow,))
                ],
              ),

            ),


            //
            TextFormField(
              decoration: InputDecoration(
                hintText: "Transaction-ID/UTR-No",
              ),
            ),
            SizedBox(height: SC.from_width(23),),


            //
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Amount'
              ),
            ),
            SizedBox(height: SC.from_width(6),),

            //
            Center(
              child: Text('यहाँ UTR नंबर डाले',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: SC.from_width(12)
              ),),
            ),
            SizedBox(height: SC.from_width(20),),

            //
            Ink(
              decoration: AppConstant.greyBoxDecoration,
              height: SC.from_width(166),
              child: InkWell(
                onTap: (){
                  
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.image,size: SC.from_width(76),),
                    Text("Payment का स्क्रीनशाट यहा ढाले",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SC.from_width(12)
                    ),)
                  ],
                ),
              ),
            ),
            SizedBox(height: SC.from_width(25),),
            
            
            CustomButton(
              onTap: (){
                RouteTo(context, child: (p0, p1) => WalletScreenWinning(),);
              },
                title: "Submit")


          ],
        ),
      ),
    );
  }
}
