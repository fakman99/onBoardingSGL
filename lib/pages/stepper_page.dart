import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:im_stepper/stepper.dart';

class StepperShopScreen extends StatefulWidget {
  @override
  _StepperShopScreenState createState() => _StepperShopScreenState();
}

class _StepperShopScreenState extends State<StepperShopScreen> {
  bool checked = false;

  String jsonData =
      '{  "0" : {  "produit0": {  "productName": "Eket Cabinet",  "brand": "Ikea",  "imagePath": "assets/product/product0.jpg",  "link": "assets/product/product1.jpg"  },  "produit1": {  "productName": "Small Eket",  "brand": "Ikea",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  },  "produit2": {  "productName": "Rakkestad with 2 doors",  "brand": "Ikea",   "imagePath": "assets/product/product2.jpg",  "link": "assets/product/product3.jpg"  },  "produit3": {  "productName": "Kleppstad with 2 doors",  "brand": "Ikea",   "imagePath": "assets/product/product4.jpg",  "link": "assets/product/product1.jpg"  },  "produit4": {  "productName": "Kleppstad with 3 doors",  "brand": "Ikea",  "imagePath": "assets/product/product5.jpg",  "link": "assets/product/product1.jpg"  },  "produit5": {  "productName": "Pax wardrobe frame",  "brand": "Ikea",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  }  },  "1": {  "produit0": {  "productName": "SGL 36 lm301b",   "brand":"SGL",  "imagePath": "assets/product/sglProduct0.jpg",  "link": "assets/product/product1.jpg"  },  "produit1": {  "productName": "Temp & rH sensor",   "brand":"SGL",  "imagePath": "assets/product/sglProduct1.jpg",  "link": "assets/product/product1.jpg"  },  "produit2": {  "productName": "SGL Blower",   "brand":"SGL",  "imagePath": "assets/product/sglProduct5.jpg",  "link": "assets/product/product1.jpg"  },  "produit3": {  "productName": "SGL Controller",   "brand":"SGL",  "imagePath": "assets/product/sglProduct2.jpg",  "link": "assets/product/product1.jpg"  },  "produit4": {  "productName": "Power supply 24V 6.25A",   "brand":"SGL",  "imagePath": "assets/product/sglProduct3.jpg",  "link": "assets/product/product1.jpg"  },  "produit5": {  "productName": "Blower & Sensor Combo",   "brand":"SGL",  "imagePath": "assets/product/sglProduct4.jpg",  "link": "assets/product/product1.jpg"  }},  "2": {  "produit0": {  "productName": "Light mix 50L",   "brand":"Biobizz",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  },  "produit1": {  "productName": "Clay pebbles",   "brand":"VitaLink",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  },  "produit2": {  "productName": "Peat pellets",   "brand":"Jiffy",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  },  "produit3": {  "productName": "Mega Crop 3kg",   "brand":"Greenleaf Nutrients",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  },  "produit4": {  "productName": "Starter Pack",   "brand":"Biotabs",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  },  "produit5": {  "productName": "Light mix 50L",   "brand":"Biobizz",  "imagePath": "assets/product/product1.jpg",  "link": "assets/product/product1.jpg"  }   }  }';
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 2; // upperBound MUST BE total number of icons minus 1.

  List<String> asset = [
    "assets/furniture.svg",
    "assets/screw.svg",
    "assets/plant.svg"
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> map = jsonDecode(jsonData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: Text("GUIDE",
            style: TextStyle(
                color: Color(0xff3BB30B),
                fontWeight: FontWeight.w300,
                fontSize: 30)),
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
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 8),
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
            stepWidget(activeStep, map),
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

  /// Returns the previous button.
  Widget stepWidget(activeStep, map) {
    return Expanded(
      child: SizedBox(
          child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: map[activeStep.toString()].length,
        itemExtent: 180.0,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Material(
              elevation: 1,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  image: DecorationImage(
                    image: AssetImage(map[activeStep.toString()]
                        ["produit$index"]["imagePath"]),
                    fit: BoxFit.contain,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: Color(0xff3BB30B)),
                            child: Text(
                              " " +
                                  map[activeStep.toString()]["produit$index"]
                                      ["productName"] +
                                  " ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ))),
                    Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Checkbox(
                            activeColor: Color(0xff3BB30B),
                            value: checked,
                            onChanged: (bool value) {
                              setState(() {
                                checked = value;
                              });
                            },
                          ),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      )),
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
