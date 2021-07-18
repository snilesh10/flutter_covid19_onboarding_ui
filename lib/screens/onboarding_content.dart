import 'package:flutter/material.dart';

import '../constants.dart';

class OnBoardingContent extends StatelessWidget {
  OnBoardingContent({this.image, this.heading, this.text});
  final image, heading, text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Image.asset(
          image,
          width: MediaQuery.of(context).orientation == Orientation.portrait
              ? 200
              : 100,
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 20
              : 10,
        ),
        Text(
          heading,
          textAlign: TextAlign.center,
          style: coHeadingStyle,
        ),
        SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 20
              : 10,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: coTextStyle,
        )
      ],
    );
  }
}
