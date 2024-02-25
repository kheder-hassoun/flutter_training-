// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
//import 'mysplashscreen.dart';
import 'myhomepage.dart';
import 'login.dart';

//! my note
//
// 1 format after ctr s
//
//wrap in a widget ctr + shift + r  // after sellect the wegit
//flutter run --debugProfileBuild// to navigate between screnn in debug mode
//
//
//
//
//
// */

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var name = _prefs.getString("name");
  var password = _prefs.getString("password");
  var fastboot = _prefs.getBool('fast_boot');
  if (fastboot != null) {
    runApp(Home(username: name.toString()));
  } else if (name != null && password != null) {
    runApp(MyApp(
      name: name,
      password: password,
    ));
  } else {
    runApp(SignUp());
  }
}

class MyApp extends StatelessWidget {
  MyApp({required this.name, required this.password});
  final String name;
  final String password;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnterScreen(
        name: name,
        password: password,
      ), //MyHomePage   LoginScreen
    );
  }
}

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(), //MyHomePage   LoginScreen
    );
  }
}

class Home extends StatelessWidget {
  Home({required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(
        username: username,
      ), //MyHomePage   LoginScreen
    );
  }
}
