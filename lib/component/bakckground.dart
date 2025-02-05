import 'package:flutter/material.dart';


class BackGround extends StatelessWidget {
  final Widget? child;
  const BackGround({this.child,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Column(
            children: [

              //
              Expanded(
                child: Opacity(opacity: .1,
                    child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              ),

              //
              Expanded(
                child: Opacity(opacity: .1,
                    child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              ),

              //
              Expanded(
                child: Opacity(opacity: .1,
                    child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              ),

              Expanded(
                child: Opacity(opacity: .1,
                    child: Image.asset("assets/mainImage/bg.png",fit: BoxFit.cover,width: double.infinity,)),
              )

            ],
          )
          ,
          if(child!=null)
            child!,
        ],
      ),
    );
  }
}
