import 'package:flutter/material.dart';
import 'OnBoardingData.dart';

/// A OnBoardWidget Class.
///
///
class OnBoardWidget extends StatefulWidget {
  final MaterialPageRoute pageRoute;

  final MaterialPageRoute stepRoute;

  OnBoardWidget(this.pageRoute, this.stepRoute);

  void skipPage(BuildContext context) {
    Navigator.push(context, pageRoute);
  }

  void stepPage(BuildContext context) {
    Navigator.push(context, stepRoute);
  }

  @override
  OnBoardWidgetState createState() {
    return new OnBoardWidgetState();
  }
}

class OnBoardWidgetState extends State<OnBoardWidget> {
  final PageController controller = new PageController();
  int currentPage = 0;
  bool lastPage = false;

  final List<OnbordingData> listData = [
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

  void _onPageChanged(int page) {
    setState(() {
      currentPage = page;
      if (currentPage == listData.length - 1) {
        lastPage = true;
      } else {
        lastPage = false;
      }
    });
  }

  Widget _buildPageIndicator(int page) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: page == currentPage ? 10.0 : 6.0,
      width: page == currentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: page == currentPage ? Color(0xff3BB30B) : Color(0xffC4C4C4),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: new Color(0xFFEEEEEE),
      padding: const EdgeInsets.all(10.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Expanded(
            flex: 1,
            child: new Container(),
          ),
          new Expanded(
            flex: 3,
            child: new PageView(
              children: listData,
              controller: controller,
              onPageChanged: _onPageChanged,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Color(0xff3BB30B),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(lastPage ? "SKIP" : "SKIP",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? null
                      : widget.skipPage(
                          context,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    child: Row(
                      children: [
                        _buildPageIndicator(0),
                        _buildPageIndicator(1),
                        _buildPageIndicator(2),
                      ],
                    ),
                  ),
                ),
                FlatButton(
                  color: Color(0xff3BB30B),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(lastPage ? "GUIDE" : "NEXT",
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0)),
                  onPressed: () => lastPage
                      ? widget.stepPage(context)
                      : controller.nextPage(
                          duration: Duration(milliseconds: 450),
                          curve: Curves.easeIn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
