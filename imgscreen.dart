// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'themeandwallpapers.dart';

class ImgScreen extends StatelessWidget {
  ImgScreen({required this.img, required this.description, super.key});

  final String img;
  final String description;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        //backgroundColor: themeforground,
        title: Text(
          "Img screen ",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradianstart, gradianend],
              stops: [0.5, 3.5],
              //begin: Alignment.topCenter,
              //end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        color: themebackground,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: Color.fromARGB(66, 71, 71, 71),
              elevation: 8.0,
              child: Column(children: <Widget>[
                SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHight / 1.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(
                      img,
                      height: double.infinity,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  " description :  $description",
                  style:
                      TextStyle(color: const Color.fromARGB(255, 6, 175, 12)),
                ),
                SizedBox(
                  height: 40,
                ),
              ]),
            ),
            SizedBox(
              height: 40,
            ),
            //button from myhomepage
            SizedBox(
                height: 110.0,
                width: screenWidth * 0.9,
                child: InkWell(
                  onTap: () => {},
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: lastcardcolor,
                    elevation: 8.0,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 130,
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              img,
                              height: double.infinity,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "future button",
                          style: TextStyle(color: themeforground),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.headphones,
                          color: themeforground,
                        )
                      ],
                    ),
                  ),
                )),

            //end of stuiped buttton
            Text("the end ",
                style: TextStyle(color: const Color.fromARGB(255, 6, 175, 12)))
          ],
        )),
      ),
    ));
  }
}
