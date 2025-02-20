import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:guru_matka_new/component/shoeMessage.dart';

import '../component/shoeMessage.dart';
import '../daimention/daimentio n.dart';


class MyactionButton extends StatefulWidget {
  Color? color;
  bool? handelError;
  Duration? duretion;
  Widget? child;
  double? height ;
  String? customErrorMessage;
  String? lable;
  Curve? curve;
  double? width;
  Function(dynamic)? onActionComplit;
  Function action;
  Widget? activeChild;
  BoxDecoration? decoration;
  BoxDecoration? activeDecoration;
  MyactionButton(
      {this.handelError,
        this.lable,
        this.color,
        this.customErrorMessage,
        this.curve,
        this.height,
        this.width,
        this.onActionComplit,
        required this.action,
        this.child,
        this.activeChild,
        this.decoration,
        this.activeDecoration,
        this.duretion,
        super.key});

  @override
  State<MyactionButton> createState() => _MyactionButtonState();
}

class _MyactionButtonState extends State<MyactionButton> {
  @override
  void didUpdateWidget(covariant MyactionButton oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  bool loding = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (loding == false) {
          loding = true;
          setState(() {});


          if(kDebugMode)
            {
              dynamic returnData = await widget.action();
              log(widget.onActionComplit.toString());
              if (widget.onActionComplit != null) {
                widget.onActionComplit!(returnData);
              }
            }
          else
            {
              try {
                dynamic returnData = await widget.action();
                log(widget.onActionComplit.toString());
                if (widget.onActionComplit != null) {
                  widget.onActionComplit!(returnData);
                }
              } catch (e) {
                log("${'--' * 10} Error from myActionButton ${'--' * 10}\n");
                log(e.toString());
                showWarningMessage(context, "THis is Errro \n${e}");
                log(widget.customErrorMessage.toString());
                log("${'--' * 10} Error from myActionButton ${'--' * 10}\n");
                if (widget.customErrorMessage != null) {
                  ('${widget.customErrorMessage}');
                } else {
                 print("Something went wrong");
                }
              }
            }

          loding = false;
          setState(() {});
        }
      },
      child: AnimatedContainer(
        curve: widget.curve ?? Curves.easeInOut,
        duration: widget.duretion ?? Duration(milliseconds: 300),
        height: widget.height??SC.from_width(49),
        // width: loding
        //     ? widget.height
        //     : widget.width ?? MediaQuery.of(context).size.width - 30,


        // width: loding
        //     ? (widget.height ?? SC.from_width(49)) // Use a default height value
        //     : (widget.width ?? MediaQuery.of(context).size.width - 30),


        width: (widget.width ?? MediaQuery.of(context).size.width - 30),
        child: Center(
            child: loding
                ? CircularProgressIndicator(
                    color: Colors.black,
                  )
                : (widget.child != null && widget.lable == null)
                    ? widget.child
                    :  Text(
              "${widget.lable ?? "Press"}",
              style:  TextStyle(fontWeight: FontWeight.w600,fontSize: SC.from_width(16),color: Colors.black),
            )),
        decoration: !loding
            ? widget.decoration ??
                BoxDecoration(
                  gradient:  LinearGradient(colors: [
                    Colors.white,
                    Color.fromRGBO(240, 167, 30, 1),
                  ]),
                    borderRadius: BorderRadius.circular(widget.height??SC.from_width(49)/2),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2),
                          offset: Offset(0, 2),
                          blurRadius: 1,
                          spreadRadius: 1)
                    ])
            : BoxDecoration(
          gradient:  LinearGradient(colors: [
            Colors.white,
            Color.fromRGBO(240, 167, 30, 1),
            ]),
                borderRadius: BorderRadius.circular(widget.height??SC.from_width(49)/2),
                boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.2),
                        offset: Offset(0, 2),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ]),
      ),
    );
  }
}


