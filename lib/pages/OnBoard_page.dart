import 'package:Onboard/pages/stepper_page.dart';
import 'package:Onboard/pages/suite.dart';
import 'package:Onboard/widgets/OnBoardingData.dart';
import 'package:Onboard/widgets/onBoard_widget.dart';
import "package:flutter/material.dart";

class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardWidget(
        MaterialPageRoute(builder: (context) => Suite()),
        MaterialPageRoute(builder: (context) => StepperShopScreen()),
      ),
    );
  }
}
