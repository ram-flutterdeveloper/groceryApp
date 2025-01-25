import 'package:flutter/material.dart';
import 'package:grocery_app/src/core/routes/routes.dart';
import 'package:grocery_app/src/ui/onboarding/on_boarding_screen.dart';
import 'package:grocery_app/utils/constants/assets_constant.dart';
import 'package:grocery_app/utils/constants/shared_pref_utils.dart';
import 'package:grocery_app/utils/extensions/extensions.dart';
import 'package:grocery_app/utils/extensions/uicontext.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  couting() async {
    Future.delayed(const Duration(seconds: 3)).then((c) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const OnBoardingScreen();
        },
      ));
    });
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      if (await SharedPrefUtils.isFreshInstall()) {
        context.clearAndPush(routePath: MyRoutes.ONBOARDING);
      } else 
      {
        print("kdsbfjhdkjfdfghv  ${await SharedPrefUtils.getToken()}");
        if (await SharedPrefUtils.getToken() == "1" ||
            await SharedPrefUtils.getToken() == null) {
          // context.clearAndPush(routePath: MyRoutes.SELECTACCOUNT);
        } else {
          context.clearAndPush(routePath: MyRoutes.BOTTOMNAV);
        }
      }
    });

    Future.delayed(const Duration(seconds: 2), () async {
      context.clearAndPush(routePath: MyRoutes.ONBOARDING);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight(),
      width: context.screenWidth(),
      child: Image.asset(
        APPASSETS.splashImagePNG,
        fit: BoxFit.fill,
      ),
    );
  }
}
