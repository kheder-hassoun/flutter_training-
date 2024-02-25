// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'themeandwallpapers.dart';
import 'imgfullscreen.dart';

var star = Icons.star;
var cover = Icons.photo_size_select_large_rounded;
var temp1 = 0.0;
var temp2 = 0.0;

class MyImgWidget extends StatefulWidget {
  MyImgWidget({required this.imgSource, required this.description});
  final String imgSource;
  final String description;
  @override
  State<StatefulWidget> createState() =>
      MyImgWidgetState(imgSource: imgSource, description: description);
}

class MyImgWidgetState extends State<MyImgWidget> {
  MyImgWidgetState({required this.imgSource, required this.description})
      : super();

  final String imgSource;
  final String description;
  void loveit() {
    setState(() {
      temp1 = 200;
      temp2 = 200;
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        temp1 = 0;
        temp2 = 0;
      });
    });
  }

  void showImagePopup(BuildContext context, String imagesrc) {
    // Create a Widget that will be displayed in the popup.
    Widget imageWidget = ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: Image.asset(
        imagesrc,
        fit: BoxFit.cover,
      ),
    );

    // Create a timer that will dismiss the popup after three seconds.
    Timer(Duration(milliseconds: 500), () {
      // Dismiss the popup.
      Navigator.of(context).pop();
    });

    // Show the popup.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: imageWidget,
        );
      },
    );
  }

  void starit() {
    setState(() {
      if (star == Icons.star_border_purple500_outlined) {
        star = Icons.star;
      } else {
        star = Icons.star_border_purple500_outlined;
      }
    });
  }

  void focus(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return ImgFullScreen(
        img: imgSource,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    double widgetwidth = screenWidth * 0.9;
    double widgethieght = screenHight / 1.2;

    return Container(
      width: widgetwidth,
      height: widgethieght,
      alignment: Alignment.center,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Color.fromARGB(88, 5, 0, 0),
        elevation: 8.0,
        child: Column(children: <Widget>[
          Stack(alignment: AlignmentDirectional.center, children: [
            SizedBox(
              width: widgetwidth,
              height: widgethieght * 0.75,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  imgSource,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: temp1,
              height: temp2,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  "assests/images/heart.png",
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: widgethieght * 0.03,
          ),
          SizedBox(
            height: widgethieght * 0.15,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      loveit();
                      //showImagePopup(context, "assests/images/heart.png");
                    },
                    child: Row(
                      children: [
                        Text(
                          "love ",
                          style: TextStyle(color: themeforground, fontSize: 18),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            "assests/images/heart.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showImagePopup(context, "assests/images/care.png");
                    },
                    child: Row(
                      children: [
                        Text(
                          "care ",
                          style: TextStyle(color: themeforground, fontSize: 18),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: Image.asset(
                            "assests/images/care.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => focus(context),
                    icon: Icon(Icons.donut_large_outlined),
                    color: const Color.fromARGB(255, 17, 138, 238),
                    iconSize: 25,
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  SizedBox(
                    width: 10,
                  )
                ]),
          ),
          Text(
            " description :  $description",
            style: TextStyle(color: const Color.fromARGB(255, 6, 175, 12)),
          ),
          SizedBox(
            height: widgethieght * 0.01,
          ),
        ]),
      ),
    );
  }
}
