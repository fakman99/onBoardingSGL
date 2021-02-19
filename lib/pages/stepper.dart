import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_stepper/stepper.dart';

class StepperShopScreen extends StatefulWidget {
  @override
  _StepperShopScreenState createState() => _StepperShopScreenState();
}

class _StepperShopScreenState extends State<StepperShopScreen> {
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.

  List<String> asset = [
    "assets/furniture.svg",
    "assets/screw.svg",
    "assets/plant.svg"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            NumberStepper(
              stepReachedAnimationDuration: Duration(seconds: 2),
              lineColor: Color(0xff3BB30B),
              activeStepColor: Color(0xff3BB30B),
              activeStepBorderColor: Color(0xff3BB30B),
              numberStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w300),
              stepRadius: 28,
              numbers: [
                1,
                2,
                3,
              ],

              // activeStep property set to activeStep variable defined above.
              activeStep: activeStep,

              // This ensures step-tapping updates the activeStep.
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            header(),
            Expanded(
              child: SvgPicture.asset(
                asset[activeStep],
                width: 212,
                height: 212,
              ),
            ),
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Our recommendation",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemExtent: 180.0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 4.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: CircleAvatar(
                                radius: 14.0,
                                backgroundColor: Color(0xff3BB30B),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "IkeHigh",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousButton(activeStep),
                nextButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return FlatButton(
      color: Color(0xff3BB30B),
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text("NEXT",
          style: new TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 16.0)),
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

  /// Returns the previous button.
  Widget previousButton(activeStep) {
    if (activeStep == 0) {
      return Container();
    } else {
      return FlatButton(
        color: Color(0xff3BB30B),
        textColor: Colors.white,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text("PREVIOUS",
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 16.0)),
        onPressed: () {
          // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.

          setState(() {
            activeStep--;
          });
        },
      );
    }
  }

  /// Returns the header wrapping the header text.
  Widget header() {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              headerText(),
              style: TextStyle(
                  color: Color(0xff3BB30B),
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }

  // Returns the header text based on the activeStep.
  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Get a bundle';

      case 2:
        return 'Start growing';

      default:
        return 'Get any furniture';
    }
  }
}
