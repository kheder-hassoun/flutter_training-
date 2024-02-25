// ignore_for_file: sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ali_app/youandi.dart';
import 'package:flutter/material.dart';

class HadoolLock extends StatefulWidget {
  const HadoolLock({super.key});

  @override
  State<HadoolLock> createState() => _HadoolLockState();
}

class _HadoolLockState extends State<HadoolLock> {
  final FocusNode _focusNode = FocusNode();
  void gohome(BuildContext context) {
    if (_passwordcontroler.text == "hadeel") {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return UandI();
      }));
    } else {
      Navigator.of(context).pop();
    }
  }

  var gradianstart = Color.fromARGB(255, 151, 2, 119);
  var gradianend = Color.fromARGB(255, 39, 2, 31);
  final _passwordcontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "its private  ",
      //     style: TextStyle(
      //         fontStyle: FontStyle.italic, fontSize: 20, color: Colors.black),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   shadowColor: Colors.transparent,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [gradianstart, gradianend],
      //         stops: [0.5, 3.5],
      //         //begin: Alignment.topCenter,
      //         //end: Alignment.bottomCenter,
      //       ),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth,
                height: screenHight,
                child: Container(
                  color: Color.fromARGB(255, 0, 0, 0),
                  child: Image.asset(
                    "assests/wallpapers/w7.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: screenWidth,
            color: Color.fromARGB(144, 0, 0, 0),
            height: screenHight,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                        height: screenHight * 0.3,
                      ),
                      SizedBox(
                        width: screenWidth * 0.8,
                        height: screenHight / 2.1,
                        child: Column(children: <Widget>[
                          TextField(
                            focusNode: _focusNode,
                            keyboardType: TextInputType.text,
                            controller: _passwordcontroler,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 234, 7, 255)),

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
                              hintText: "enter password ",
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 11,
                                  color: Color.fromARGB(199, 6, 212, 6)),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color.fromARGB(255, 228, 6, 180),
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
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
