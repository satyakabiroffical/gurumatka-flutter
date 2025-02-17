import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/Controllers/profileProvider.dart';
import 'package:guru_matka_new/apiService/api_path.dart';
import 'package:guru_matka_new/component/CustomButton.dart';
import 'package:guru_matka_new/component/bakckground.dart';
import 'package:guru_matka_new/component/profilfield.dart';
import 'package:guru_matka_new/component/provfileAvtar.dart';
import 'package:guru_matka_new/daimention/daimentio%20n.dart';
import 'package:provider/provider.dart';

import '../../component/appIcons.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileProvider>(context,listen: false).initUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: Scaffold(

        //
        appBar: AppBar(
          title:Text("Account"),
        ),

        //
        body: Consumer<ProfileProvider>(builder: (context, p, child) =>
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),

          //
          children: [
            SizedBox(height: SC.from_width(20),),

            //avtar
            InkWell(
              onTap: ()=>p.selectProfileImage(context),
              child: ProfieleAvtar(
                redias: SC.from_width(52),

                //
                child: (p.selectedImage!=null)?
                Image.file(File('${p.selectedImage}',),fit: BoxFit.cover,):
                Image.network("${MyUrl.bucketUrl}${p.user?.image}", fit: BoxFit.cover,),

                //
              ),
            ),
            SizedBox(height: SC.from_width(24),),

            //name
            ProfileField(
              controller: p.nameController,
              hintText: "Name",
            ),
            SizedBox(height: SC.from_width(24),),

            //
            ProfileField(
              controller: p.emailController,
              hintText: "Email Address",
            ),
            SizedBox(height: SC.from_width(24),),


            //Gender Selector
            DropdownButtonFormField(

              //
              value: p.gender,

              //
              decoration: InputDecoration(
                filled: false,
                labelText: "Gender",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: SC.from_width(14),
                  color: Colors.white
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  )
                ),

                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    )
                ),

                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    )
                ),

              ),
                items: [

                  //'MALE', 'FEMALE', or 'OTHER'",
                  DropdownMenuItem(
                    child: Text("Male"),
                    value: "MALE",),

                  DropdownMenuItem(
                    child: Text("Female"),
                    value: "FEMALE",),

                  DropdownMenuItem(
                    child: Text("Other"),
                    value: "OTHER",)
                ],
                onChanged: (d){
                p.setGender(d);
            }),
            SizedBox(height: SC.from_width(24),),

            //
            ProfileField(
              controller: p.addressController,
              hintText: "Address",
            ),
            SizedBox(height: SC.from_width(24),),

            //
            InkWell(
              onTap: ()async{
                p.selectDOB(context);
              },
              child: ProfileField(
                enable: false,
                controller: p.dobController,
                hintText: "Date of Birth",
              ),
            ),
            SizedBox(height: SC.from_width(24),),

            CustomButton(
              onTap: (){
                p.updateProfile(context);
              },
                title: "Submit"
            ),

            if(kDebugMode)
              Text('${p.gender}'),

          ],

        )),
      ),
    );
  }
}
