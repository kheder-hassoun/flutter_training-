// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'itsme.dart';
import 'signup.dart';
import 'themeandwallpapers.dart';
import 'myhomepage.dart';
import 'package:marquee/marquee.dart';
import 'data.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  void gologin(BuildContext ctx) {
    Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (_) {
      return LoginScreen();
    }));
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

  final String helptext = "⚠ this app devloped by kheder   ";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.85,
      height: screenHight, //*0.9
      padding:
          EdgeInsets.fromLTRB(0, 30, 0, 0), //EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(20)),
            side: BorderSide(color: themeforground, width: 1)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: screenHight,
              width: screenWidth,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: screenHight * 0.4,
                    width: screenWidth * 0.6,
                    child: Image.asset(
                      "assests/gif/8.gif",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: screenHight * 0.1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 1.5, 0),
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    curve: Curves.bounceIn,
                    duration: Duration(milliseconds: 1900),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Hi $usernameglobal  🥰',
                            style: TextStyle(color: themeforground)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(" Have anice day 💕",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 5, 241, 13))),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'Go Login ',
                      style: TextStyle(color: themeforground),
                    ),
                    leading: Icon(
                      Icons.login,
                      color: Color.fromARGB(255, 248, 244, 2),
                    ),
                    onTap: () {
                      gologin(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'delete account',
                      style: TextStyle(color: themeforground),
                    ),
                    leading: Icon(
                      color: Color.fromARGB(255, 248, 244, 2),
                      Icons.delete,
                    ),
                    onTap: () {
                      Data.showDeleteAccountConfirmationDialog(context);
                      //showDeleteConfirmationDialog(context);
                    },
                  ),
                  ListTile(
                    title: Text(
                      'edit profiile ',
                      style: TextStyle(color: themeforground),
                    ),
                    leading: Icon(
                      color: Color.fromARGB(255, 248, 244, 2),
                      Icons.edit,
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return ItsMe();
                      }));
                    },
                  ),
                  SizedBox(
                    height: screenHight * 0.40,
                    width: screenWidth * 0.3,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      width: screenWidth * 0.3,
                      height: 40,
                      child: Marquee(
                        text: helptext,
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 236, 221, 7)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
