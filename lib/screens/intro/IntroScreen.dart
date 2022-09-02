import 'package:flutter/material.dart';
import '../../res/ResColor.dart';
import '../../res/ResString.dart';
import '../onboarding/LoginScreen.dart';

class IntroScreen extends StatefulWidget {
  static String id = 'IntroScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;
  String nextStr = "Next";
  late PageController _pageController;

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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: size.height / 1.4,
                  color: whiteColor,
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        currentIndex = page;
                        if (page == 2) {
                          nextStr = finish;
                        } else {
                          nextStr = next;
                        }
                      });
                    },
                    controller: _pageController,
                    children: <Widget>[
                      makePage(
                          image: '${imagePath}img_intro_1.png',
                          title: stepOneTitle,
                          content: stepOneContent,
                          height: 380.0),
                      makePage(
                          image: '${imagePath}img_intro_2.png',
                          title: stepTwoTitle,
                          content: stepTwoContent,
                          height: 380.0),
                      makePage(
                          image: '${imagePath}img_intro_3.png',
                          title: stepThreeTitle,
                          content: stepThreeContent,
                          height: 380.0),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildIndicator(),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (nextStr == finish) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                              (Route<dynamic> route) => false);
                        } else {
                          setState(() {
                            currentIndex += 1;
                            _pageController.animateToPage(currentIndex,
                                duration: const Duration(seconds: 1),
                                curve: Curves.ease);
                          });
                        }
                      },
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("${imagePath}ic_btn_bg.png"))),
                        child: Center(
                          child: Text(
                            currentIndex == 2 ? getStarted : next,
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 16,
                                fontFamily: ubuntuBold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget makePage({image, title, content, height}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          image,
          width: double.maxFinite,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: blackColor, fontSize: 19, fontFamily: poppinsBold),
        ),
        SizedBox(
          height: 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: greyColor, fontSize: 13, fontFamily: poppinsRegular),
          ),
        ),
      ],
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 5,
      width: isActive ? 18 : 12,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: isActive ? mainColor : greyColor2,
          borderRadius: BorderRadius.circular(5)),
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
