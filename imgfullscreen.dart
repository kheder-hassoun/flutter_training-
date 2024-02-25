import 'package:flutter/material.dart';

class ImgFullScreen extends StatelessWidget {
  const ImgFullScreen({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: InteractiveViewer(
        maxScale: 4,
        child: Image.asset(
          img,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
