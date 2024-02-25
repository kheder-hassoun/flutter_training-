// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math';

class UandI extends StatefulWidget {
  const UandI({super.key});

  @override
  State<UandI> createState() => _UandIState();
}

class _UandIState extends State<UandI> {
  List<String> paths = [
    "assests/hadool/1.png",
    "assests/hadool/2.png",
    "assests/hadool/3.png",
    "assests/hadool/4.png",
    "assests/hadool/5.png",
    "assests/hadool/6.png",
    "assests/hadool/7.png",
    "assests/hadool/8.png",
    "assests/hadool/9.png",
    "assests/hadool/10.png",
    "assests/hadool/11.png",
    "assests/hadool/12.jpg",
    "assests/hadool/13.jpg",
    "assests/hadool/14.jpg",
    "assests/hadool/15.jpg",
    "assests/hadool/16.jpg",
    "assests/hadool/17.jpg",
    "assests/hadool/18.jpg",
    "assests/hadool/19.jpg",
  ];

  String imgpath = "";
  int randomNumber = 0;
  @override
  void initState() {
    super.initState();
    Random random = Random();
    randomNumber = random.nextInt(paths.length - 1);
    imgpath = paths[randomNumber];
  }

  void changeimg(String p) {
    setState(() {
      imgpath = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;

    double widgetsize = 100;
    List<Widget> imgs = [
      InkWell(
          onTap: () {
            changeimg("assests/hadool/1.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/1.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/2.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/2.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/3.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/3.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/4.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/4.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/5.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/5.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/6.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/6.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/7.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/7.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/8.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/8.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/9.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/9.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/10.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/10.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/11.png");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/11.png"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/12.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/12.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/13.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/13.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/14.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/14.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/15.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/15.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/16.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/16.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/17.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/17.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/18.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/18.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/19.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/19.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/kheder.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/kheder.jpg"))),
      //! end
      InkWell(
          onTap: () {
            changeimg("assests/hadool/kheder2.jpg");
          },
          child: SizedBox(
              width: widgetsize,
              height: widgetsize,
              child: Image.asset("assests/hadool/kheder2.jpg"))),
      //! end
    ];
    Random random = Random();
    imgs.shuffle(random);

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHight,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            InteractiveViewer(
              maxScale: 7,
              minScale: 0.1,
              child: SizedBox(
                height: screenHight * 0.7,
                width: screenWidth,
                child: Image.asset(
                  imgpath,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHight * 0.2,
                  width: screenWidth * 0.5,
                  child: CarouselSlider(
                      options: CarouselOptions(
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        height: widgetsize + 50,
                        enlargeCenterPage: true,
                        initialPage: 0,
                      ),
                      items: //list of widget so i need a map to make the list of string or object to list of widget
                          imgs),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
