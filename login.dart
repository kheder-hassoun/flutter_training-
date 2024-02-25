// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, no_logic_in_create_state, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'signup.dart';
import 'data.dart';
import 'themeandwallpapers.dart';
import 'dart:async';
import 'myhomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterScreen extends StatefulWidget {
  EnterScreen({required this.name, required this.password});
  final String name;
  final String password;
  @override
  State<StatefulWidget> createState() =>
      _EnterScreenState(name: name, password: password);
}

class _EnterScreenState extends State<EnterScreen> {
  _EnterScreenState({required this.name, required this.password}) : super();

  final String name;
  final String password;
  final FocusNode _focusNode = FocusNode();

  final _passwordcontroler = TextEditingController();
  var tmptext = "";
  var firstButtonSize = 80.0;
  var secondButtonSize = 110.0;
  var firstmsg = "";
  int myopacity = 255;
  double kisssizefamily = 0;
  double kisssize2family = 0;
  String enterwallpaper = "assests/wallpapers/w5.jpg";
  void hidekeyboard() {
    _focusNode.unfocus();
  }

  Future<void> showwoordbyword(String msg) async {
    try {
      for (int i = 0; i < msg.length; i++) {
        //print("i is :$i");
        if (msg[i] == ' ') {
          firstmsg += msg[i];
          // dont stop here

          continue;
        }

        firstmsg += msg[i];
        await Future.delayed(Duration(milliseconds: 50));
        if (msg[i] == '.') {
          await Future.delayed(Duration(milliseconds: 60));
          firstmsg = " ";
        }
        setState(() {});
      }

      setState(() {
        Timer.periodic(Duration(milliseconds: 5), (timer) {
          if (myopacity > 0) {
            myopacity--;

            setState(() {});
          } else {
            firstmsg = "";
            setState(() {});
            timer.cancel();
          }
        });
      });
      //String mystring = msg;
      // setState(() {
      //   Timer.periodic(Duration(milliseconds: 5), (timer) {
      //     if (mystring.isNotEmpty) {
      //       mystring = mystring.substring(0, mystring.length - 1);

      //       setState(() {
      //         firstmsg = mystring;
      //       });
      //     } else {
      //       timer.cancel();
      //     }
      //   });
      // });
    } catch (e) {
      print(3);
      print(e);
    }
  }

  void helpme(String msg) {
    setState(() {
      showwoordbyword(msg);
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 10), () async {
      SharedPreferences temp = await SharedPreferences.getInstance();

      var imgwallpaper = temp.getString('loginwallpaper');
      if (imgwallpaper != null) {
        setState(() {
          enterwallpaper = imgwallpaper;
        });
      }
    });
    Timer(Duration(milliseconds: 2), () {
      helpme("Hi $name nice  to meet you again we misssed you  ");
    });
  }

  void gohome(BuildContext ctx) {
    if (_passwordcontroler.text == password) {
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
        return MyHomePage(
          username: name,
        );
      }));
    } else {
      showSnackBar(
        ctx,
        "sorry incorrect password",
        Colors.red,
      );
    }
  }

  void showSnackBar(BuildContext context1, String message, Color color) {
    ScaffoldMessenger.of(context1).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: color,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void gologin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
                height: screenHight, width: screenWidth, color: Colors.black),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: screenHight * (0.1),
                  // ),
                  SizedBox(
                    height: screenHight * 0.99,
                    width: screenWidth,
                    child: Image.asset(
                      enterwallpaper, //screen wallpaper
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 10,
                    height: screenHight * 0.3,
                  ),
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: screenHight / 2.1,
                    child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        TextField(
                          focusNode: _focusNode,
                          keyboardType: TextInputType.number,
                          controller: _passwordcontroler,
                          style: TextStyle(color: themeforground),

                          // onChanged: (value) {
                          //   userpassword = value;
                          // },
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 150, 212, 4),
                                    width: 1),
                                borderRadius: BorderRadius.circular(30.0)),
                            hintText:
                                " hi $usernameglobal 💕 enter ur password ",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 11,
                                color: Color.fromARGB(199, 6, 212, 6)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: themeforground,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 248, 252, 15),
                                fontStyle: FontStyle.italic),
                            focusColor: Color.fromARGB(255, 248, 252, 15),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 248, 252, 15),
                                    width: 1),
                                borderRadius: BorderRadius.circular(30.0)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                gohome(context);
                              },
                              child: SizedBox(
                                height: 105,
                                width: 100,
                                child: Opacity(
                                  opacity: 0.8,
                                  child: Image.asset(
                                    "assests/gif/3.gif",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(
              height: 80,
            ),
            SizedBox(
              width: screenWidth,
              child: Text(
                firstmsg,
                style: TextStyle(
                    color: Color.fromARGB(myopacity, 247, 5, 227),
                    fontSize: 30,
                    shadows: <Shadow>[
                      Shadow(
                          color: Color.fromARGB(210, 108, 4, 117),
                          offset: Offset(5, 8))
                    ],
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 8,
                ),
                InkWell(
                  onTap: () {
                    Data.showDeleteAccountConfirmationDialog(context);

                    Timer.periodic(Duration(seconds: 2), (timer) async {
                      SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      if (_prefs.getString('name') == null) {
                        Navigator.of(context)
                            .pushReplacement(MaterialPageRoute(builder: (_) {
                          return LoginScreen();
                        }));
                      }
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: screenWidth * 0.2,
                      height: 50,
                      color: Color.fromARGB(0, 34, 71, 56),
                      child: Icon(Icons.help,
                          size: 40, color: Color.fromARGB(248, 252, 5, 5)),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }
}
