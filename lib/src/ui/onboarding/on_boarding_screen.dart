import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/routes/routes.dart';
import 'package:grocery_app/src/ui/login/login_screen.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/constants/shared_pref_utils.dart';
import 'package:grocery_app/utils/extensions/extensions.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int currentIndex = 0;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  nextFunction() {
    _pageController.nextPage(duration: _kDuration, curve: _kCurve);
  }

  skipFunction() {
    SharedPrefUtils.setFreshInstall(isFresh: false).then(
      (value) => context.clearAndPush(routePath: MyRoutes.BOTTOMNAV, args: 0),
    );

    // Navigator.pushReplacement(context, MaterialPageRoute(
    //   builder: (context) {
    //     return const LoginScreen();
    //   },
    // ));
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 20,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent.withOpacity(0.2),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15).copyWith(top: 40),
              child: PageView(
                controller: _pageController,
                onPageChanged: onChangedFunction,
                children: <Widget>[
                  Stack(
                    children: [
                      Image.asset(APPASSETS.onBoardMan),
                      Positioned(
                        top: 20,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            skipFunction();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Skip",
                                style:
                                    context.customMedium(APPCOLOR.appGreen, 14),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: APPCOLOR.appGreen,
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 100,
                        right: 0,
                        left: 0,
                        child: Container(
                          // height: 100,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Indicator(
                                      positionIndex: 0,
                                      currentIndex: currentIndex,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Indicator(
                                      positionIndex: 1,
                                      currentIndex: currentIndex,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Indicator(
                                      positionIndex: 2,
                                      currentIndex: currentIndex,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "Buy Groceries Easily with US",
                                    textAlign: TextAlign.center,
                                    style: context.customExtraBold(
                                        Colors.black, 22),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "It is a long established fact that a reader will be distracted by the readable",
                                  textAlign: TextAlign.center,
                                  style:
                                      context.customRegular(Colors.black, 16),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              nextFunction();
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 10,
                                  style: BorderStyle.solid,
                                ),
                                color: APPCOLOR.appGreen,
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        top: 10,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            skipFunction();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Skip",
                                style:
                                    context.customMedium(APPCOLOR.appGreen, 14),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: APPCOLOR.appGreen,
                                    borderRadius: BorderRadius.circular(90)),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(APPASSETS.onBoardMan),
                      Positioned(
                        bottom: 100,
                        right: 0,
                        left: 0,
                        child: Container(
                          // height: 100,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Indicator(
                                      positionIndex: 0,
                                      currentIndex: currentIndex,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Indicator(
                                      positionIndex: 1,
                                      currentIndex: currentIndex,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Indicator(
                                      positionIndex: 2,
                                      currentIndex: currentIndex,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "We  Delivery Grocery at Your Doorstep",
                                    textAlign: TextAlign.center,
                                    style: context.customExtraBold(
                                        Colors.black, 22),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "It is a long established fact that a reader will be distracted by the readable",
                                  textAlign: TextAlign.center,
                                  style:
                                      context.customRegular(Colors.black, 16),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              nextFunction();
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 10,
                                  style: BorderStyle.solid,
                                ),
                                color: APPCOLOR.appGreen,
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(APPASSETS.onBoardMan),
                      Positioned(
                        bottom: 100,
                        right: 0,
                        left: 0,
                        child: Container(
                          // height: 100,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Indicator(
                                      positionIndex: 0,
                                      currentIndex: currentIndex,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Indicator(
                                      positionIndex: 1,
                                      currentIndex: currentIndex,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Indicator(
                                      positionIndex: 2,
                                      currentIndex: currentIndex,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    "All Your Kitchen Needs are Here",
                                    textAlign: TextAlign.center,
                                    style: context.customExtraBold(
                                        Colors.black, 22),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "It is a long established fact that a reader will be distracted by the readable",
                                  textAlign: TextAlign.center,
                                  style:
                                      context.customRegular(Colors.black, 16),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 60,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              skipFunction();
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 10,
                                  style: BorderStyle.solid,
                                ),
                                color: APPCOLOR.appGreen,
                                borderRadius: BorderRadius.circular(90),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;
  const Indicator(
      {super.key, required this.currentIndex, required this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
          color: positionIndex == currentIndex
              ? APPCOLOR.appGreen
              : Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(100)),
    );
  }
}
