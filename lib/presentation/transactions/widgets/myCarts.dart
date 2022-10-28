import 'package:flutter/material.dart';

import '../../../utils/styles.dart';

class MyCard extends StatelessWidget {
  const MyCard({
    Key? key,
    required this.cityName,
    required this.colorsGradient
  }) : super(key: key);

  final String cityName;
  final List<Color> colorsGradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      height: 130,
      width: 340,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient:  LinearGradient(
              colors: colorsGradient
          )
      ),
      child: Stack(
        children: [
          Positioned(
              top: 15,
              left: 20,
              child: Text(cityName, style: MyTextStyle.bold32.copyWith(color: Colors.white, fontSize: 25),)),
          Positioned(
              top: 55,
              left: 20,
              child: Text("5367 1120 8905 0177", style: MyTextStyle.regular14.copyWith(color: Colors.white, fontSize: 15),)),
          Positioned(
              top: 15,
              right: 20,
              child: Text("¥ 127,803.19", style: MyTextStyle.bold32.copyWith(color: Colors.white, fontSize: 25),)),
        ],
      ),
    );
  }
}