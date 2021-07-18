import 'package:flutter/material.dart';
import 'package:flutter_covid19_onboarding_ui/constants.dart';

import 'onboarding_content.dart';

class OnboardingApp extends StatefulWidget {
  const OnboardingApp({Key? key}) : super(key: key);

  @override
  _OnboardingAppState createState() => _OnboardingAppState();
}

class _OnboardingAppState extends State<OnboardingApp> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Covid 19 Prevention Tips",
      "text":
          "Please follow these prevention tips to avoid Covid 19 Infection.",
      "image": "assets/images/covid-19.png"
    },
    {
      'title': 'Wash Your Hands',
      'text':
          'Use water and soap and rub your hands for at least 20 seconds. Or Use hand sanitizer to clean your hands.',
      'image': 'assets/images/soap-wash.png'
    },
    {
      'title': 'Avoid Handshake',
      'text':
          'Similarly, avoid touching other people. Skin-to-skin contact can transmit Covid-19 Virus from one person to another, So Avoid Contacts.',
      'image': 'assets/images/avoid-handshake.png'
    },
    {
      "title": "Keep Social Distance",
      "text":
          "If you must go out for necessities, keep a distance of 6 feet (2 m) from other people.",
      "image": "assets/images/keep-social-distance.png"
    },
    {
      'title': 'Stay Home',
      'text': 'Stay at your home and avoid crowded places',
      'image': 'assets/images/stay-home.png'
    },
    {
      "title": "Wear a Mask",
      "text":
          "Everyone should wear a cloth face mask in public places where physical distancing may be difficult, These masks can help prevent transmission of Covid 19 Virus.",
      "image": "assets/images/wear-mask.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => OnBoardingContent(
                      image: splashData[index]['image'],
                      heading: splashData[index]['title'],
                      text: splashData[index]['text']),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index: index)),
                  )),
                  buildButton()
                ],
              )),
        ],
      )),
    );
  }

  Container buildDot({required int index}) {
    return Container(
      width: index == currentPage ? 30 : 10,
      height: 10,
      margin: EdgeInsets.only(left: 5),
      decoration: BoxDecoration(
          color: currentPage == index ? Colors.black : Colors.red,
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Container buildButton() {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.all(0),
      child: currentPage == splashData.length - 1
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent, primary: Colors.red),
              onPressed: () {},
              child: Text(
                'GET STARTED',
                style: coButtonTextStyle,
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shadowColor: Colors.transparent, primary: Colors.red),
              onPressed: () {},
              child: Text(
                'SKIP',
                style: coButtonTextStyle,
              ),
            ),
    );
  }
}
