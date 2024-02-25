// ignore_for_file: unused_local_variable, prefer_const_literals_to_create_immutables, no_logic_in_create_state, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class TransparentButton extends StatefulWidget {
  const TransparentButton(
      {super.key,
      required this.heartcolor,
      required this.immoji,
      required this.buttontext,
      required this.icondata,
      required this.iconcolor,
      required this.onPressed});
  final Color heartcolor;
  final String buttontext;
  final IconData icondata;
  final Color iconcolor;
  final String immoji;
  final void Function() onPressed;
  @override
  State<TransparentButton> createState() => _TransparentButtonState(
      heartcolor: heartcolor,
      immoji: immoji,
      buttontext: buttontext,
      icondata: icondata,
      iconcolor: iconcolor,
      onPressed: onPressed);
}

class _TransparentButtonState extends State<TransparentButton> {
  _TransparentButtonState(
      {required this.heartcolor,
      required this.immoji,
      required this.buttontext,
      required this.icondata,
      required this.iconcolor,
      required this.onPressed})
      : super();
  final Color heartcolor;
  final String immoji;
  final String buttontext;
  final IconData icondata;
  final Color iconcolor;
  final void Function() onPressed;
  final _scrolcontroler = ScrollController();
  IconData hearticon = Icons.favorite_border;
  String hottext = " Loading  ..";
  Color bordercolor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    var random = Random();
    var myrandomnumber = random.nextInt(5) + 5;
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   heartbreat();
    // });
    Timer.periodic(Duration(seconds: myrandomnumber), (timer) {
      inithottext(buttontext);
    });
  }

  // void heartbreat() {
  //   setState(() {
  //     if (bordercolor == Colors.transparent) {
  //       bordercolor = iconcolor;
  //     } else {
  //       bordercolor = Colors.transparent;
  //     }
  //   });
  // }

  void inithottext(String msg) {
    setState(() {
      hottext = "";
    });
    refrechhottext(msg);
  }

  Future<void> refrechhottext(String msg) async {
    var random = Random();
    var myrandomnumber = random.nextInt(200) +
        200; //i want the speed of typing difernt from object to others
    for (int i = 0; i < msg.length; i++) {
      _scrolcontroler.animateTo(_scrolcontroler.position.maxScrollExtent,
          duration: Duration(milliseconds: myrandomnumber),
          curve: Curves.easeOut);

      if (msg[i] == '/') {
        await Future.delayed(Duration(seconds: 1));
        hottext = " ";
        continue;
      }

      hottext += msg[i];
      await Future.delayed(Duration(milliseconds: 200));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    double widgetwidth = screenWidth * 0.40;
    double widgethieght = screenHight / 6.7;
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: widgethieght,
        width: widgetwidth,
        child: Card(
          color: Color.fromARGB(12, 44, 44, 44),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(color: iconcolor, width: 1)),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      hearticon,
                      color: heartcolor,
                      size: 30,
                    ),
                    SizedBox(
                      width: screenWidth * 0.13,
                    ),
                    Text(
                      immoji,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Icon(
                  icondata,
                  color: iconcolor,
                ),
                SizedBox(
                  height: 3,
                ),
                SizedBox(
                  height: 20,
                  child: SingleChildScrollView(
                    controller: _scrolcontroler,
                    child: Column(
                      children: [
                        Text(
                          hottext,
                          style: TextStyle(color: iconcolor, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
