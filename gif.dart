import 'package:flutter/material.dart';

//u can delete this stupied callss and replace it in the homescreen its used just once
//for testing
class Gif extends StatefulWidget {
  const Gif({super.key});

  @override
  State<Gif> createState() => _GifState();
}

class _GifState extends State<Gif> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assests/gif/70.gif",
      fit: BoxFit.fill,
    );
  }
}
