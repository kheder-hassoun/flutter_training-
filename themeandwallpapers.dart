// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'myhomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

String loginwallpaper = "assests/wallpapers/w3.jpg";
var themeforground = Color.fromARGB(255, 238, 9, 188);
var themebackground = Colors.black;
var lastcardcolor = Color.fromARGB(255, 48, 19, 42);
var gradianstart = Color.fromARGB(255, 151, 2, 119);
var gradianend = Color.fromARGB(255, 39, 2, 31);

class MyTheme extends StatefulWidget {
  const MyTheme({super.key});

  @override
  State<MyTheme> createState() => _MyThemeState();
}

class _MyThemeState extends State<MyTheme> {
  void closethescreen(BuildContext ctx) {
    Navigator.of(ctx).pop(ctx);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    double widgetheight = screenWidth * 04;
    void getimgfrompref() async {
      SharedPreferences temp1 = await SharedPreferences.getInstance();
      var isitnull = temp1.getString('loginwallpaper');
      if (isitnull != null) {
        setState(() {
          loginwallpaper = isitnull;
        });
      }
    }

    @override
    void initState() {
      super.initState();
      Timer(Duration(seconds: 1), () {
        getimgfrompref();
      });
    }

    List<Widget> wallpaperlist = [
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w1.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w1.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w2.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w2.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w3.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w3.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w4.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w4.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w5.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w5.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            homewallpaper = "assests/gif/9.gif";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/gif/9.gif",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w7.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w7.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w8.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w8.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            homewallpaper = "assests/wallpapers/w9.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('wallpaper', homewallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w9.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       homewallpaper = "assests/wallpapers/w10.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('wallpaper', homewallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w10.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       homewallpaper = "assests/wallpapers/w11.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('wallpaper', homewallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w11.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       homewallpaper = "assests/wallpapers/w12.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('wallpaper', homewallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w12.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       homewallpaper = "assests/wallpapers/w13.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('wallpaper', homewallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w13.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
    ];
    List<Widget> wallpaperlist2 = [
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w1.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w1.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w2.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w2.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/gif/5.gif";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/gif/5.gif",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w3.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w3.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w4.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w4.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w5.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w5.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/gif/9.gif";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/gif/9.gif",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w7.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w7.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w8.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w8.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      InkWell(
        //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
        onTap: () async {
          setState(() {
            loginwallpaper = "assests/wallpapers/w9.jpg";
          });
          SharedPreferences t = await SharedPreferences.getInstance();
          t.setString('loginwallpaper', loginwallpaper);
        },
        child: SizedBox(
          width: 80,
          height: widgetheight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assests/wallpapers/w9.jpg",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       loginwallpaper = "assests/wallpapers/w10.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('loginwallpaper', loginwallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w10.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       loginwallpaper = "assests/wallpapers/w11.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('loginwallpaper', loginwallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w11.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       loginwallpaper = "assests/wallpapers/w12.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('loginwallpaper', loginwallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w12.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
      // InkWell(
      //   //اجباري اعمل ودجت ياخذ دخل له اسم لصورة وهو يقوم بانشاء صفحة بهذه الصورة تحتوي زر حفظ وخالصين
      //   onTap: () async {
      //     setState(() {
      //       loginwallpaper = "assests/wallpapers/w13.jpg";
      //     });
      //     SharedPreferences t = await SharedPreferences.getInstance();
      //     t.setString('wallpaper', loginwallpaper);
      //   },
      //   child: SizedBox(
      //     width: 80,
      //     height: widgetheight,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(20),
      //       child: Image.asset(
      //         "assests/wallpapers/w13.jpg",
      //         height: double.infinity,
      //         width: double.infinity,
      //         fit: BoxFit.fill,
      //       ),
      //     ),
      //   ),
      // ),
    ];
    // double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "theme & wallpaper ",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    color: Colors.black),
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
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  color: Colors.black,
                  height: screenHight,
                  width: screenWidth,
                ),
                SizedBox(
                  height: double.infinity,
                  width: screenWidth,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 230,
                            color: Color.fromARGB(113, 90, 90, 90),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "selcet the homePage wallpaper ",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: screenWidth * 0.4,
                                      width: screenWidth * 0.3,
                                      child: CarouselSlider(
                                          options: CarouselOptions(
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(seconds: 2),
                                            height: screenWidth * 0.4,
                                            enlargeCenterPage: true,
                                            initialPage: 0,
                                          ),
                                          items: //list of widget so i need a map to make the list of string or object to list of widget
                                              wallpaperlist),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "selected img ",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 10, 214, 16)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: SizedBox(
                                            height: screenWidth * 0.4,
                                            width: screenWidth * 0.3,
                                            child: Image.asset(
                                              homewallpaper,
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ), //now the enter wallpaper
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Container(
                            height: 230,
                            color: Color.fromARGB(113, 90, 90, 90),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "selcet the LoginScreen wallpaper ",
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      height: screenWidth * 0.4,
                                      width: screenWidth * 0.3,
                                      child: CarouselSlider(
                                          options: CarouselOptions(
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(seconds: 2),
                                            height: screenWidth * 0.4,
                                            enlargeCenterPage: true,
                                            initialPage: 0,
                                          ),
                                          items: //list of widget so i need a map to make the list of string or object to list of widget
                                              wallpaperlist2),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "selected img ",
                                          style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 10, 214, 16)),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: SizedBox(
                                            height: screenWidth * 0.4,
                                            width: screenWidth * 0.3,
                                            child: Image.asset(
                                              loginwallpaper,
                                              height: double.infinity,
                                              width: double.infinity,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        //the third eliment
                        // TweenAnimationBuilder<Color?>(
                        //     tween: ColorTween(begin: Colors.blue, end: Colors.red),
                        //     // ignore: sort_child_properties_last

                        //     duration: Duration(seconds: 10),
                        //     builder: (_, Color? color, child) {
                        //       return SizedBox(
                        //         width: 150,
                        //         height: 100,
                        //         child: Card(
                        //           color: Colors.black,
                        //           shape: RoundedRectangleBorder(
                        //               borderRadius:
                        //                   BorderRadius.all(Radius.circular(30)),
                        //               side: BorderSide(
                        //                   color:color, width: 1)),
                        //         ),
                        //       );
                        //     }),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
