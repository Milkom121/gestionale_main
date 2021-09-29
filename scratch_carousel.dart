



import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            color: Colors.green,
            height: 100,
            width: double.infinity,
          ) ,),
      ),
    );
  }
}
