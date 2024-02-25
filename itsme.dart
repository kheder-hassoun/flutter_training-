// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItsMe extends StatefulWidget {
  const ItsMe({super.key});

  @override
  State<ItsMe> createState() => _ItsMeState();
}

class _ItsMeState extends State<ItsMe> {
  bool isFastBootEnabled = false;
  String storedname = "";
  String storedpassword = "";
  void getusernameandpassword() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    storedname = _prefs.getString('name')!;
    storedpassword = _prefs.getString('password')!;
  }
  //! functions for fast boot

  void loadFastBootStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? fastBoot = prefs.getBool('fast_boot');

    if (fastBoot != null) {
      setState(() {
        isFastBootEnabled = fastBoot;
      });
    }
  }

  void updateFastBootStatus(bool newValue) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (newValue) {
      // Set the variable to true
      prefs.setBool('fast_boot', true);
    } else {
      // Delete the variable or set it to null
      prefs.remove('fast_boot');
    }

    setState(() {
      isFastBootEnabled = newValue;
    });
  }

//? end of fast boot functions
  @override
  void initState() {
    super.initState();
    loadFastBootStatus();
    getusernameandpassword();
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

  void savedata(BuildContext ctx) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove("name");
    _prefs.remove("password");
    _prefs.setString('name', _namecontroler.text);
    _prefs.setString('password', _passwordcontroler.text);
    showSnackBar(ctx, "succesfully Done ✔", Color.fromARGB(255, 26, 247, 6));
    Timer(Duration(seconds: 1), () {
      Navigator.of(ctx).pop();
    });
  }

  final _namecontroler = TextEditingController();
  final _passwordcontroler = TextEditingController();
  var gradianstart = Color.fromARGB(255, 151, 2, 119);
  var gradianend = Color.fromARGB(255, 39, 2, 31);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " edite profile ",
          style: TextStyle(
              fontStyle: FontStyle.italic, fontSize: 20, color: Colors.black),
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
            height: screenHight,
            width: screenWidth,
            color: Colors.black,
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHight * 0.1,
                ),
                SizedBox(
                  width: screenWidth * 0.8,
                  height: screenHight / 1.9,
                  child: Card(
                    color: Color.fromARGB(41, 49, 49, 49),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 255, 119, 7),
                            width: 0.8)),
                    child: Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.all(10),
                      child: Column(children: <Widget>[
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.person_pin,
                          color: const Color.fromARGB(255, 255, 119, 7),
                          size: 50,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.name,
                          controller: _namecontroler,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 119, 7)),

                          // onChanged: (value) {
                          //   usernaame = value;
                          //   amazingfunction(value);
                          // },
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              hintText: "write ur name",
                              hintStyle: TextStyle(
                                  color: Color.fromARGB(115, 109, 110, 109),
                                  fontStyle: FontStyle.italic),
                              //helperText: "your name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: const Color.fromARGB(255, 255, 119, 7),
                              ),
                              labelText: storedname,
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 248, 252, 15),
                                  fontStyle: FontStyle.italic),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 248, 252, 15),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(30.0))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: _passwordcontroler,
                          style: TextStyle(
                              color: const Color.fromARGB(255, 255, 119, 7)),

                          // onChanged: (value) {
                          //   userpassword = value;
                          // },
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(20.0),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(30.0)),
                            hintText: "write a  password",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Color.fromARGB(115, 109, 110, 109)),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: const Color.fromARGB(255, 255, 119, 7),
                            ),
                            labelText: storedpassword,
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
                        FloatingActionButton.extended(
                          backgroundColor: Color.fromARGB(244, 163, 14, 3),
                          foregroundColor: Colors.black,
                          onPressed: () => savedata(context),
                          label: Text("Save"),
                          icon: Text("📲"),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHight * 0.1,
                ),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: Card(
                    color: const Color.fromARGB(255, 95, 95, 93),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(70)),
                        side: BorderSide(
                            color: const Color.fromARGB(255, 255, 119, 7),
                            width: 0.8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Fast Boot:  ',
                          style:
                              TextStyle(color: Color.fromARGB(255, 26, 224, 8)),
                        ),
                        SizedBox(height: 20),
                        Checkbox(
                          activeColor: Color.fromARGB(255, 14, 243, 6),
                          value: isFastBootEnabled,
                          splashRadius: 20,
                          hoverColor: const Color.fromARGB(255, 7, 218, 255),
                          onChanged: (newValue) {
                            updateFastBootStatus(newValue!);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
