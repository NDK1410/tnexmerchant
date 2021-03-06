import 'package:flutter/material.dart';
import 'package:tnexmerchant/src/helpers/MyString.dart';
import 'package:tnexmerchant/src/helpers/MyColors.dart';
import 'package:tnexmerchant/src/helpers/CustomClipPath.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey[100],
          ),
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              padding: EdgeInsets.only(top: 85),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              height: 540,
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    currentIndex = page;
                  });
                },
                controller: _pageController,
                children: <Widget>[
                  makePage(
                    image: 'assets/1-register/introslide.png',
                    title: MyString.step1,
                    content: MyString.step4,
                  ),
                  makePage(
                    // reverse: true,
                    image: 'assets/1-register/introslide.png',
                    title: MyString.step2,
                    content: MyString.step4,
                  ),
                  makePage(
                    image: 'assets/1-register/introslide.png',
                    title: MyString.step3,
                    content: MyString.step4,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 440),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 540),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: SizedBox(
                      height: 40,
                      width: 280,
                      child: RaisedButton(
                        color: MyColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "I want to create an account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: Text(
                        "I already have an account",
                        style: TextStyle(
                          color: MyColors.primary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(
      padding: EdgeInsets.only(bottom: 125),
      // height: 420,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
                  children: <Widget>[
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        color: MyColors.brand_dark,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "TNEX Merchant",
                      style: TextStyle(
                        color: MyColors.brand_dark,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        height: 180,
                        width: 226,
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                )
              : SizedBox(),
          Text(
            title,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w500),
          ),
          reverse
              ? Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: MyColors.primary, borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
