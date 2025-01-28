// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:grocery_app/src/ui/cart/cartview_screen.dart';
import 'package:grocery_app/src/ui/favourite/favourite_screen.dart';
import 'package:grocery_app/src/ui/header.dart';
import 'package:grocery_app/src/ui/home/home_screen.dart';
import 'package:grocery_app/src/ui/profilepage/profile_screen.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBarWidget> {
  int _currentIndex = 0;
  PageController bottomWidgetPageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void _onNavButtonTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (bottomWidgetPageController.hasClients) {
      bottomWidgetPageController.animateToPage(index,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    }
  }

  @override
  void initState() {
    _currentIndex = 0;
    bottomWidgetPageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
    
      body: PageView(
        controller: bottomWidgetPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[

          HomeScreen(),
          FavouriteScreen(),
          Mycart(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: SizeConfig.blockSizeHorizontal! * 15,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              top: 0,
              left: (_currentIndex * MediaQuery.sizeOf(context).width / 4) + 42,
              child: Column(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      height: SizeConfig.blockSizeHorizontal! * 4,
                      width: SizeConfig.blockSizeHorizontal! * 5,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            APPCOLOR.lightGreen.withOpacity(0.8),
                            APPCOLOR.lightGreen.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavButton(
                  icon: Icons.home,
                  index: 0,
                  currentIndex: _currentIndex,
                  onPressed: _onNavButtonTapped,
                ),
                BottomNavButton(
                  icon: Icons.favorite,
                  index: 1,
                  currentIndex: _currentIndex,
                  onPressed: _onNavButtonTapped,
                ),
                BottomNavButton(
                  icon: Icons.shopping_bag,
                  index: 2,
                  currentIndex: _currentIndex,
                  onPressed: _onNavButtonTapped,
                ),
                BottomNavButton(
                  icon: Icons.person,
                  index: 3,
                  currentIndex: _currentIndex,
                  onPressed: _onNavButtonTapped,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }
}

class BottomNavButton extends StatelessWidget {
  final Function(int) onPressed;
  final IconData? icon;
  final int? index;
  final int? currentIndex;

  const BottomNavButton({
    super.key,
    this.icon,
    required this.onPressed,
    this.index,
    this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index != null) {
          onPressed(index!);
        }
      },
      child: Container(
        height: SizeConfig.blockSizeHorizontal! * 13,
        width: SizeConfig.blockSizeHorizontal! * 17,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: AnimatedOpacity(
          opacity: (currentIndex == index) ? 1 : 0.2,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: Icon(
            icon,
            color: (currentIndex == index) ? APPCOLOR.lightGreen : Colors.black,
            size: SizeConfig.blockSizeHorizontal! * 6,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(SizeConfig.blockSizeHorizontal! * 3, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width - SizeConfig.blockSizeHorizontal! * 3, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
