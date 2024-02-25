// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, no_logic_in_create_state, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'gif.dart';
import 'hadoollock.dart';
import 'login.dart';
import 'memories.dart';
import 'mydrwer.dart';
import 'study.dart';
import 'itsme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'tasks.dart';
import 'sounds.dart';
import 'dart:async';
import 'mynote.dart';
import 'package:marquee/marquee.dart';
import 'transparentbutton.dart';
import 'themeandwallpapers.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//end of audio

String usernameglobal = "user";
String homewallpaper = "assests/wallpapers/w1.jpg";

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.username});

  final String username;

  @override
  State<StatefulWidget> createState() => _MyHomePageState(username: username);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.username}) : super();

  final String username;
  //this to access the drawer after delete the app bar
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  void openDrawer() {
    _scaffoldkey.currentState!.openDrawer();
  }

  @override
  void initState() {
    usernameglobal = username;
    super.initState();
    Timer(Duration(milliseconds: 10), () {
      getrate();
      getwallpaper();
    });

    Timer(Duration(seconds: 5), () {
      showFlushBarBottom(context, " welcome please wait ..🥰",
          Color.fromARGB(255, 199, 3, 206), 12);
    });
  }

  int counter = 0;

  var coloroflastcard;
  var lastx = 220.0;
  var lasty = 100.0;
  var d = 30.0; //destance between buttons in the first line
  var d2 = 40.0; // destance between buttons in the last line
  double sliderwidth = 140;
  double sliderhiegth = 130;
  var temp1 = 0.0;
  var temp2 = 0.0;
  var temp3 = 0.0;
  var duration = 1;

  String cardtext = "  all your data   will be saved locally✨ in"
      " your phone 📲 and will be incripted 🔐  "
      "no one can see it or control it anymore  "
      "in the future there will be an optional "
      "choice to save it in a google account 📡. ";
  var star1 = Icons.star_border;
  var star2 = Icons.star_border;
  var star3 = Icons.star_border;
  var star4 = Icons.star_border;
  var star5 = Icons.star_border;
  var s1 = 'false', s2 = 'false', s3 = 'false', s4 = 'false', s5 = 'false';

// void playAudio() {
//     AudioPlayer player = AudioPlayer();
//     player.setVolume(1.0);
//     player.play("assests/audio/messenger.mp3");
//   }

  void saverate(String s1, String s2, String s3, String s4, String s5) async {
    SharedPreferences temp = await SharedPreferences.getInstance();
    temp.setString('star1', s1);
    temp.setString('star2', s2);
    temp.setString('star3', s3);
    temp.setString('star4', s4);
    temp.setString('star5', s5);
  }

  void removerate() async {
    SharedPreferences temp = await SharedPreferences.getInstance();
    temp.remove('star1');
    temp.remove('star2');
    temp.remove('star3');
    temp.remove('star4');
    temp.remove('star5');
  }

  void getrate() async {
    SharedPreferences temp1 = await SharedPreferences.getInstance();
    var isitnull = temp1.getString('star1');
    if (isitnull != null) {
      s1 = temp1.getString("star1").toString();
      s2 = temp1.getString("star2").toString();
      s3 = temp1.getString("star3").toString();
      s4 = temp1.getString("star4").toString();
      s5 = temp1.getString("star5").toString();
    } else {
      //the s1 ,s2 ... is by defult 'false'
    }
    initstaricons();
  }

//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
  void getwallpaper() async {
    SharedPreferences t = await SharedPreferences.getInstance();
    var isitnull = t.getString('wallpaper');
    if (isitnull != null) {
      homewallpaper = isitnull;
    }
  }

//wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
  void initstaricons() {
    if (s1 == "true") {
      star1 = Icons.star;
    } else {
      star1 = Icons.star_border;
    }
    if (s2 == 'true') {
      star2 = Icons.star;
    } else {
      star2 = Icons.star_border;
    }
    if (s3 == 'true') {
      star3 = Icons.star;
    } else {
      star3 = Icons.star_border;
    }
    if (s4 == 'true') {
      star4 = Icons.star;
    } else {
      star4 = Icons.star_border;
    }
    if (s5 == 'true') {
      star5 = Icons.star;
    } else {
      star5 = Icons.star_border;
    }
    setState(() {});
  }

  void starit(int t) {
    setState(() {
      if (t == 1) {
        if (star1 == Icons.star_border) {
          star1 = Icons.star;
          s1 = 'true';
        } else {
          star1 = Icons.star_border;
          s1 = 'false';
        }
      }
      if (t == 2) {
        if (star2 == Icons.star_border) {
          star2 = Icons.star;
          s2 = 'true';
        } else {
          star2 = Icons.star_border;
          s2 = 'false';
        }
      }
      if (t == 3) {
        if (star3 == Icons.star_border) {
          star3 = Icons.star;
          s3 = 'true';
        } else {
          star3 = Icons.star_border;
          s3 = 'false';
        }
      }
      if (t == 4) {
        if (star4 == Icons.star_border) {
          star4 = Icons.star;
          s4 = 'true';
        } else {
          star4 = Icons.star_border;
          s4 = 'false';
        }
      }
      if (t == 5) {
        if (star5 == Icons.star_border) {
          star5 = Icons.star;
          s5 = 'true';
        } else {
          star5 = Icons.star_border;
          s5 = 'false';
        }
      }
    });
    removerate();
    saverate(s1, s2, s3, s4, s5);
    getrate();
  }

  void lovecaresadit(int n) {
    if (n == 1) {
      setState(() {
        temp1 = 200;
      });

      Timer(Duration(seconds: duration), () {
        setState(() {
          temp1 = 0;
        });
      });
    }
    if (n == 2) {
      setState(() {
        temp2 = 200;
      });

      Timer(Duration(seconds: duration), () {
        setState(() {
          temp2 = 0;
        });
      });
    }
    if (n == 3) {
      setState(() {
        temp3 = 200;
      });

      Timer(Duration(seconds: duration), () {
        setState(() {
          temp3 = 0;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom_bar_list = <Widget>[
      IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(
            Icons.update,
            color: const Color.fromARGB(255, 12, 131, 230),
          )),
      InkWell(
        onTap: () {
          lovecaresadit(1);
          MySound.playAudio("assests/audio/3.mp3");
        },
        child: SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(
            "assests/images/heart.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          lovecaresadit(2);
          MySound.playAudio("assests/audio/1.mp3");
        },
        child: SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(
            "assests/images/care.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
      InkWell(
        onTap: () {
          lovecaresadit(3);
          MySound.playAudio("assests/audio/1.mp3");
        },
        child: SizedBox(
          width: 25,
          height: 25,
          child: Image.asset(
            "assests/images/sad.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
      ),
      IconButton(
          onPressed: () async {
            SharedPreferences _prefs = await SharedPreferences.getInstance();
            var name = _prefs.getString("name");
            var password = _prefs.getString("password");
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) {
              return EnterScreen(
                name: name.toString(),
                password: password.toString(),
              );
            }));
          },
          icon: Icon(
            Icons.lock_open_outlined,
            color: const Color.fromARGB(255, 230, 207, 7),
          )),
    ];
    List<Widget> myratelist = [
      Row(
        children: [
          Text("Colors  :  ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 7, 143), fontSize: 15)),
          IconButton(
              onPressed: () => {starit(1)},
              icon: Icon(
                star1,
                color: Color.fromARGB(255, 221, 245, 11),
              ))
        ],
      ),
      Row(
        children: [
          Text("Control  : ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 7, 143), fontSize: 15)),
          IconButton(
              onPressed: () => {starit(2)},
              icon: Icon(
                star2,
                color: Color.fromARGB(255, 221, 245, 11),
              ))
        ],
      ),
      Row(
        children: [
          Text("Conforte :",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 7, 143), fontSize: 15)),
          IconButton(
              onPressed: () => {starit(3)},
              icon: Icon(
                star3,
                color: Color.fromARGB(255, 221, 245, 11),
              ))
        ],
      ),
      Row(
        children: [
          Text("Speed  :   ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 7, 143), fontSize: 15)),
          IconButton(
              onPressed: () => {starit(4)},
              icon: Icon(
                star4,
                color: Color.fromARGB(255, 221, 245, 11),
              ))
        ],
      ),
      Row(
        children: [
          Text("Friendly : ",
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 7, 143), fontSize: 15)),
          IconButton(
              onPressed: () => {starit(5)},
              icon: Icon(
                star5,
                color: Color.fromARGB(255, 221, 245, 11),
              ))
        ],
      )
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AlertDialog(
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                title: Row(
                  children: [
                    Text(
                      "Close the App ",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 214, 21, 7)),
                    ),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        "assests/gif/70.gif",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
                content: Text("Are you sure 💔?",
                    style: TextStyle(color: Color.fromARGB(255, 219, 133, 2))),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Cancel the deletion
                      MySound.playAudio("assests/audio/open.mp3");
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel",
                        style:
                            TextStyle(color: Color.fromARGB(255, 3, 138, 25))),
                  ),
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: Text("Yes",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 214, 21, 7))),
                  ),
                ],
              ),
            );
          },
        );
        return false;
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          // extendBody: true, //? let the body go under the bootm bar
          // bottomNavigationBar: CurvedNavigationBar(
          //   index: index,
          //   items: bottom_bar_list,
          //   height: screenHeight * 0.07,
          //   color: Color.fromARGB(61, 0, 0, 0),
          //   backgroundColor: Colors.transparent,
          // ),
          key: _scaffoldkey,
          drawer: MyDrawer(),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                  color: Colors.black,
                  height: screenHeight,
                  width: screenWidth,
                  child: Container(
                    color: Colors.black,
                    height: screenHeight,
                    width: screenWidth,
                    child: Image.asset(
                      homewallpaper, //screen wallpaper
                      fit: BoxFit.fill,
                    ),
                  )),

              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Opacity(
                      opacity: 0.7,
                      child: SizedBox(
                        //!this control the size of the first card

                        width: screenWidth,
                        height: screenHeight / 2.6,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Card(
                              color: Color.fromARGB(103, 37, 37, 37),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  side: BorderSide(
                                      color: Color.fromARGB(190, 102, 101, 101),
                                      width: 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 3,
                                      ),
                                      IconButton(
                                          onPressed: openDrawer,
                                          icon: Icon(
                                            Icons.menu,
                                            color: Colors.yellow,
                                          )),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            " hi ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontStyle: FontStyle.italic,
                                                color: Color.fromARGB(
                                                    255, 4, 193, 250)),
                                          ),
                                          Text(
                                            " $username ",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Color.fromARGB(
                                                    255, 228, 4, 248),
                                                fontStyle: FontStyle.italic,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 40,
                                            height: 30,
                                            child: Image.asset(
                                              "assests/gif/12.gif",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      Icon(
                                        Icons.facebook,
                                        color: const Color.fromARGB(
                                            255, 5, 128, 228),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.whatshot,
                                        color: const Color.fromARGB(
                                            255, 10, 235, 17),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.home,
                                        color: const Color.fromARGB(
                                            255, 240, 21, 6),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    color: Color.fromARGB(255, 129, 129, 129),
                                    height: 5,
                                    indent: screenWidth * 0.02,
                                    endIndent: screenWidth * 0.02,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      //!the gif  widget
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: sliderwidth,
                                          color:
                                              Color.fromARGB(143, 63, 63, 62),
                                          height: sliderhiegth,
                                          child: Gif(),
                                        ),
                                      ),
                                      //end of gif widget
                                      SizedBox(
                                        width: 20,
                                      ),

                                      //!the rate widget
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          color:
                                              Color.fromARGB(143, 63, 63, 62),
                                          height: sliderhiegth,
                                          width: 150,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "Rate App",
                                                style: TextStyle(
                                                    color: themeforground,
                                                    fontSize: 15),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              CarouselSlider(
                                                  options: CarouselOptions(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    autoPlay: true,
                                                    autoPlayAnimationDuration:
                                                        Duration(
                                                            milliseconds: 1000),
                                                    height: sliderhiegth * 0.3,
                                                    enlargeCenterPage: true,
                                                    initialPage: 0,
                                                  ),
                                                  items: //list of widget so i need a map to make the list of string or object to list of widget
                                                      myratelist),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    star1,
                                                    color: Color.fromARGB(
                                                        255, 221, 245, 11),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    star2,
                                                    color: Color.fromARGB(
                                                        255, 245, 11, 11),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    star3,
                                                    color: Color.fromARGB(
                                                        255, 32, 245, 4),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    star4,
                                                    color: Color.fromARGB(
                                                        255, 245, 11, 11),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    star5,
                                                    color: Color.fromARGB(
                                                        255, 221, 245, 11),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      //end rate widget
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),

                                  //!the second line in the card (second wwidget in its column ) (bottom bar ) ❤🥰😢

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          child: Container(
                                            width: screenWidth * 0.7,
                                            color:
                                                Color.fromARGB(143, 63, 63, 62),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: bottom_bar_list,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    //!  this out of the card الشريط الاخباري

                    ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Container(
                        width: screenWidth * 0.93,
                        height: 55,
                        color: Color.fromARGB(73, 65, 64, 64),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 50,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(1),
                                child: Image.asset(
                                  "assests/images/ai.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: screenWidth * 0.7,
                                  height: 50,
                                  child: SingleChildScrollView(
                                    //required
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: screenWidth * 0.7,
                                          height: 30,
                                          child: Marquee(
                                              text: cardtext,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.normal,
                                                  color: Color.fromARGB(
                                                      255, 6, 243, 18))),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      color: Color.fromARGB(139, 129, 129, 129),
                      height: 5,
                      indent: screenWidth * 0.1,
                      endIndent: screenWidth * 0.1,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    //!this sizedbox of the transpernt buttons section
                    SizedBox(
                      width: screenWidth * 0.98,
                      height: screenHeight * 0.5,
                      child: SingleChildScrollView(
                        child: Column(
                          // the transpernt buttons section
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Divider(
                            //   color: const Color.fromARGB(255, 200, 54, 244),
                            //   height: screenHeight * 0.05,
                            //   indent: screenWidth * 0.2,
                            //   endIndent: screenWidth * 0.2,
                            // ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 4, 43, 1),
                                  immoji: "📝",
                                  buttontext: " study",
                                  icondata: Icons.school_outlined,
                                  iconcolor: Color.fromARGB(255, 164, 243, 17),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return StudyList();
                                    }));
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 233, 9, 9),
                                  immoji: "📱",
                                  buttontext: " My Secret Note ",
                                  icondata: Icons.note_add,
                                  iconcolor: Color.fromARGB(255, 32, 160, 245),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return ToDoList();
                                    }));
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 9, 61, 233),
                                  immoji: "✨",
                                  buttontext: " U & Me ",
                                  icondata: Icons.favorite,
                                  iconcolor: Color.fromARGB(255, 143, 0, 0),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return HadoolLock();
                                    }));
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 233, 9, 233),
                                  immoji: "🌹",
                                  buttontext: " Memories ",
                                  icondata: Icons.mobile_friendly_outlined,
                                  iconcolor: Color.fromARGB(255, 221, 230, 236),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return Memory();
                                    }));
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TransparentButton(
                                  heartcolor:
                                      Color.fromARGB(255, 245, 238, 238),
                                  immoji: "🧾",
                                  buttontext: " Tasks",
                                  icondata: Icons.work_history_sharp,
                                  iconcolor: Color.fromARGB(255, 205, 17, 243),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return Tasks();
                                    }));
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 233, 61, 9),
                                  immoji: "🎨",
                                  buttontext: " wallpaper & colors ",
                                  icondata: Icons.color_lens_rounded,
                                  iconcolor: Color.fromARGB(255, 7, 202, 236),
                                  onPressed: () {
                                    setState(() {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return MyTheme();
                                      }));
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 28, 233, 9),
                                  immoji: "🎵",
                                  buttontext: " Run ",
                                  icondata: Icons.star,
                                  iconcolor: Colors.yellow,
                                  onPressed: () {
                                    MySound.playAudio("assests/audio/3.mp3");
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TransparentButton(
                                  heartcolor: Color.fromARGB(255, 9, 199, 233),
                                  immoji: "🔐",
                                  buttontext: " Setting  ",
                                  icondata: Icons.settings,
                                  iconcolor: Color.fromARGB(255, 236, 41, 7),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (_) {
                                      return ItsMe();
                                    }));
                                  },
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: const Color.fromARGB(255, 200, 54, 244),
                              height: screenHeight * 0.1,
                              indent: screenWidth * 0.2,
                              endIndent: screenWidth * 0.2,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              ////the bottom bar

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: duration),
                    width: temp1,
                    height: temp1,
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
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: duration),
                    width: temp2,
                    height: temp2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        "assests/images/care.png",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: Duration(seconds: duration),
                    width: temp3,
                    height: temp3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: Image.asset(
                        "assests/images/sad.png",
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context1, String message, Color color) {
    ScaffoldMessenger.of(context1).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void showFlushBarTop(
    BuildContext context1,
    String msg,
    Color color,
    int scd,
  ) {
    Flushbar(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      flushbarPosition: FlushbarPosition.TOP,
      message: msg,
      icon: CircularProgressIndicator(
        color: const Color.fromARGB(255, 15, 238, 23),
      ),
      backgroundColor: Color.fromARGB(171, 5, 4, 5),
      messageColor: color,
      duration: Duration(seconds: scd),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: color,
    ).show(context);
  }

  void showFlushBarBottom(
    BuildContext context1,
    String msg,
    Color color,
    int scd,
  ) {
    Flushbar(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
      flushbarPosition: FlushbarPosition.TOP,
      message: msg,
      icon: SizedBox(
        width: 8,
        height: 8,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: const Color.fromARGB(255, 15, 238, 23),
        ),
      ),
      backgroundColor: Color.fromARGB(223, 5, 4, 5),
      messageColor: color,
      duration: Duration(seconds: scd),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: color,
    ).show(context);
  }
}
