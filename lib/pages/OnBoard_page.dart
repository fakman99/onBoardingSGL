import 'package:Onboard/pages/stepper.dart';
import 'package:Onboard/pages/suite.dart';
import 'package:Onboard/widgets/OnBoardingData.dart';
import 'package:Onboard/widgets/onBoard_widget.dart';
import "package:flutter/material.dart";

class OnBoardScreen extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      imagePath: "assets/1.svg",
      title: RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: "Create a ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w300)),
            new TextSpan(
                text: "plant ",
                style: TextStyle(
                    color: Color(0xff3BB30B),
                    fontSize: 22,
                    fontWeight: FontWeight.w300)),
            new TextSpan(
              text: "and a ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w300),
            ),
            new TextSpan(
                text: "Green LAB",
                style: TextStyle(
                    color: Color(0xff3BB30B),
                    fontSize: 22,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      desc:
          "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription",
    ),
    OnbordingData(
      imagePath: "assets/2.svg",
      title: RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: "Add the ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w300)),
            new TextSpan(
                text: "SGL ",
                style: TextStyle(
                    color: Color(0xff3BB30B),
                    fontSize: 22,
                    fontWeight: FontWeight.w300)),
            new TextSpan(
              text: "controller ",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
      desc:
          "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription",
    ),
    OnbordingData(
      imagePath: "assets/3.svg",
      title: RichText(
        text: new TextSpan(
          // Note: Styles for TextSpans must be explicitly defined.
          // Child text spans will inherit styles from parent
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: "Explore",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w300)),
          ],
        ),
      ),
      desc:
          "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new IntroScreen(
        list,
        MaterialPageRoute(builder: (context) => Suite()),
        MaterialPageRoute(builder: (context) => StepperShopScreen()),
      ),
    );
  }
}
