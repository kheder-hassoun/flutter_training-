// ignore_for_file: prefer_const_constructors

import 'package:ali_app/themeandwallpapers.dart';
import 'package:flutter/material.dart';

class MemoryItem extends StatefulWidget {
  const MemoryItem({
    super.key,
    required this.details,
    required this.color,
  });
  final String details;
  final Color color;
  @override
  // ignore: no_logic_in_create_state
  State<MemoryItem> createState() => _MemoryItemState(
        details: details,
        color: color,
      );
}

class _MemoryItemState extends State<MemoryItem> {
  _MemoryItemState({required this.details, required this.color});
  final String details;
  final Color color;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "details 📤  ",
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
      body: Container(
        width: screenWidth,
        color: Colors.black,
        height: screenHight,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Divider(
                color: Color.fromARGB(255, 216, 10, 216),
                height: 30,
                indent: screenWidth * 0.02,
                endIndent: screenWidth * 0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: screenWidth * 0.9,
                  color: Color.fromARGB(143, 63, 63, 62),
                  height: screenHight * 0.5,
                  child: Text(
                    details,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        color: color),
                  ),
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 216, 10, 216),
                height: 30,
                indent: screenWidth * 0.02,
                endIndent: screenWidth * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
