import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final String image;
  final String title1;
  final String title2;

  OnBoardingItem(
      {required this.image, required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(image),
        ),
        SizedBox(
          height: 100.0,
        ),
        Text(
          title1,
          style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'Blueberry Sans',
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          title2,
          style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Blueberry Sans',
              fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
