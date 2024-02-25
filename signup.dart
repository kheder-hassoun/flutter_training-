// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'mydrwer.dart';
import 'themeandwallpapers.dart';
import 'dart:async';
import 'myhomepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _namecontroler = TextEditingController();
  final _passwordcontroler = TextEditingController();
  int counter = 0;
  var tmptext = "";
  var firstButtonSize = 80.0;
  var secondButtonSize = 110.0;
  var firstmsg = "";

  Future<void> showwoordbyword(String msg) async {
    try {
      for (int i = 0; i < msg.length; i++) {
        //print("i is :$i");
        if (msg[i] == '/') {
          await Future.delayed(Duration(milliseconds: 400));
          firstmsg = " ";

          continue;
        }
        if (msg[i] == '.') {
          firstmsg = " ";
          continue;
        }
        firstmsg += msg[i];
        await Future.delayed(Duration(milliseconds: 100));
        setState(() {});
      }
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
    Timer(Duration(seconds: 2), () {
      helpme(
          "Hi ! / you will only see this screen once / please enter your name and set a password  .");
    });
  }

  void savedata(BuildContext ctx) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString('name', _namecontroler.text);
    _prefs.setString('password', _passwordcontroler.text);
    if (_namecontroler.text == "hadeel") {
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
        return MyHomePage(
          username: _namecontroler.text,
        );
      }));
    } else {
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
        return MyHomePage(
          username: _namecontroler.text,
        );
      }));
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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Stack(
            alignment: Alignment.topCenter,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: screenHight,
                    width: screenWidth,
                    child: Image.asset(
                      "assests/wallpapers/w3.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: screenHight,
                    width: screenWidth,
                    child: Opacity(
                      opacity: 0.4,
                      child: Image.asset(
                        "assests/gif/2.gif", //screen wallpaper
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                          height: 100,
                        ),
                        SizedBox(
                          width: screenWidth * 0.8,
                          height: screenHight / 1.9,
                          child: Card(
                            color: Color.fromARGB(41, 49, 49, 49),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(70)),
                                side: BorderSide(
                                    color: themeforground, width: 0.8)),
                            child: Container(
                              color: Colors.transparent,
                              padding: EdgeInsets.all(10),
                              child: Column(children: <Widget>[
                                SizedBox(
                                  height: 15,
                                ),
                                Icon(
                                  Icons.person_pin,
                                  color: themeforground,
                                  size: 50,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
                                  keyboardType: TextInputType.name,
                                  controller: _namecontroler,
                                  style: TextStyle(color: themeforground),

                                  // onChanged: (value) {
                                  //   usernaame = value;
                                  //   amazingfunction(value);
                                  // },
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(20.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      hintText: "write ur name",
                                      hintStyle: TextStyle(
                                          color: Color.fromARGB(
                                              115, 109, 110, 109),
                                          fontStyle: FontStyle.italic),
                                      //helperText: "your name",
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: themeforground,
                                      ),
                                      labelText: 'Username',
                                      labelStyle: TextStyle(
                                          color:
                                              Color.fromARGB(255, 248, 252, 15),
                                          fontStyle: FontStyle.italic),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 248, 252, 15),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30.0))),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextField(
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
                                            color: themebackground, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    hintText: "write a  password",
                                    hintStyle: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color:
                                            Color.fromARGB(115, 109, 110, 109)),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: themeforground,
                                    ),
                                    labelText: 'Password',
                                    labelStyle: TextStyle(
                                        color:
                                            Color.fromARGB(255, 248, 252, 15),
                                        fontStyle: FontStyle.italic),
                                    focusColor:
                                        Color.fromARGB(255, 248, 252, 15),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 248, 252, 15),
                                            width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                FloatingActionButton.extended(
                                  backgroundColor:
                                      Color.fromARGB(244, 141, 4, 111),
                                  foregroundColor: themebackground,
                                  onPressed: () => savedata(context),
                                  label: Text("Save"),
                                  icon: Icon(Icons.save_alt),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ]),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Text(
                      firstmsg,
                      style: TextStyle(
                          color: Color.fromARGB(255, 247, 5, 227),
                          fontSize: 35,
                          shadows: <Shadow>[
                            Shadow(
                                color: Color.fromARGB(210, 56, 2, 61),
                                offset: Offset(3, 5))
                          ],
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
