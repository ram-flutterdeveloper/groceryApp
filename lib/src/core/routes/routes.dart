import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery_app/src/ui/bottomnavigation/bottom_bar_widget.dart';
import 'package:grocery_app/src/ui/entername/enter_fullname_screen.dart';
import 'package:grocery_app/src/ui/login/login_screen.dart';
import 'package:grocery_app/src/ui/onboarding/on_boarding_screen.dart';
import 'package:grocery_app/src/ui/otp/otp_screen.dart';
import 'package:grocery_app/src/ui/splash/splash_screen.dart';
import 'package:grocery_app/utils/constants/globle_variable.dart';

/// Route names as constants
class MyRoutes {
  static GoRouter router = GoRouter(
      navigatorKey: GlobalVariable.globalScaffoldKey,
      initialLocation: SPLASH,
      routes: [
        animatedGoRoute(
          path: SPLASH,
          name: SPLASH,
          pageBuilder: (context, state) => const SplashScreen(),
        ),

        animatedGoRoute(
          path: ONBOARDING,
          name: ONBOARDING,
          pageBuilder: (context, state) => const OnBoardingScreen(),
        ),

        animatedGoRoute(
          path: LOGIN,
          name: LOGIN,
          pageBuilder: (context, state) => LoginScreen(),
        ),

        animatedGoRoute(
          path: OTPSCREEN,
          name: OTPSCREEN,
          pageBuilder: (context, state) => const OtpScreen(),
        ),

        animatedGoRoute(
          path: FULLNAME,
          name: FULLNAME,
          pageBuilder: (context, state) => const EnterFullNameScreen(),
        ),

        animatedGoRoute(
          path: BOTTOMNAV,
          name: BOTTOMNAV,
          pageBuilder: (context, state) => const BottomBarWidget(),
        ),

        //   animatedGoRoute(
        //     path: TERMANDCONDITIONS,
        //     name: TERMANDCONDITIONS,
        //     pageBuilder: (context, state) => const TermsAndConditionsScreen(),
        //   ),
        //   animatedGoRoute(
        //       path: SETUPBUSSINESS,
        //       name: SETUPBUSSINESS,
        //       pageBuilder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         final String status = extra?['status'] ?? '';
        //         return SetupBussiness(status: status);
        //       }),
        //   animatedGoRoute(
        //     path: CREATESTORE,
        //     name: CREATESTORE,
        //     pageBuilder: (context, state) => const CreateStore(),
        //   ),
        //    animatedGoRoute(
        //     path: UPDATESTORE,
        //     name: UPDATESTORE,
        //      pageBuilder: (context, state) {
        //         final extra = state.extra as Map<String, dynamic>?;
        //         final String status = extra?['storeId'] ?? '';
        //         return UpdateStoreScreen(storeId: status);
        //       }

        //   ),

        //   animatedGoRoute(
        //     path: SUBMITSCREEN,
        //     name: SUBMITSCREEN,
        //     pageBuilder: (context, state) => const PinCreated(),
        //   ),
        //   animatedGoRoute(
        //     path: APPROVEDSTATUS,
        //     name: APPROVEDSTATUS,
        //     pageBuilder: (context, state) => const ApprovalScreen(),
        //   ),
        //   animatedGoRoute(
        //     path: SIGNUP,
        //     name: SIGNUP,
        //     pageBuilder: (context, state) => LoginHostScreen(),
        //   ),
        //   animatedGoRoute(
        //     path: DASHBOARDSCREEN,
        //     name: DASHBOARDSCREEN,
        //     pageBuilder: (context, state) => DashboardScree(),
        //   ),
        //   animatedGoRoute(
        //     path: CUSTOMERORDER,
        //     name: CUSTOMERORDER,
        //     pageBuilder: (context, state) {
        //       // Extract data from `state.extra`
        //       final Map<String, dynamic> orderDetails =
        //           state.extra as Map<String, dynamic>;

        //       return CustomerOrder(
        //         orderDetails:
        //             orderDetails, // Pass the data to the destination widget
        //       );
        //     },
        //   ),
        //   animatedGoRoute(
        //     path: PRODUCTFORMSCREEN,
        //     name: PRODUCTFORMSCREEN,
        //     pageBuilder: (context, state) => ProductFormScreen(),
        //   ),
        //   animatedGoRoute(
        //     path: PRODUCTDETAILS,
        //     name: PRODUCTDETAILS,
        //     pageBuilder: (context, state) {
        //       final Product product = state.extra as Product;
        //       return Productdetails(
        //         product: product, // Pass the `Product` object directly
        //       );
        //     },
        //   ),
        //   animatedGoRoute(
        //     path: TRANSACTIONHISTORY,
        //     name: TRANSACTIONHISTORY,
        //     pageBuilder: (context, state) => TransactionHistory(),
        //   ),
        //   animatedGoRoute(
        //     path: INSIGHTSHISTORY,
        //     name: INSIGHTSHISTORY,
        //     pageBuilder: (context, state) => InsightsHistory(),
        //   ),
        //   animatedGoRoute(
        //     path: DETAILSBUSSINESS,
        //     name: DETAILSBUSSINESS,
        //     pageBuilder: (context, state) => DetailsBussiness(),
        //   ),
        //   animatedGoRoute(
        //     path: STOREMANAGEMENT,
        //     name: STOREMANAGEMENT,
        //     pageBuilder: (context, state) => StoreManagement(),
        //   ),
        //   animatedGoRoute(
        //     path: SETTING,
        //     name: SETTING,
        //     pageBuilder: (context, state) => Settings(),
        //   ),
        //   animatedGoRoute(
        //     path: FORGETPASSWORD,
        //     name: FORGETPASSWORD,
        //     pageBuilder: (context, state) => ForgetPassword(),
        //   ),
        //   animatedGoRoute(
        //     path: VERIFYPASSWORD,
        //     name: VERIFYPASSWORD,
        //     pageBuilder: (context, state) => VerifyOtpForgetPassword(),
        //   ),
        //   animatedGoRoute(
        //     path: FORGETNEWPASSWORD,
        //     name: FORGETNEWPASSWORD,
        //     pageBuilder: (context, state) => ForgetNewPassword(),
        //   ),
        // ],
      ]);

  /// Route constants
  static const SPLASH = "/";
  static const FULLNAME = "/fullname";

  static const BOTTOMNAV = "/bottomnav";

  static const HOME = "/home";

  static const SELECTACCOUNT = "/selectAccount";
  static const DASHBOARD = "/dashboard";

  static const BOTTOM_NAV = "/home";
  static const LOGIN = "/login";
  static const ONBOARDING = "/onboarding";
  static const TERMANDCONDITIONS = "/termsandcondition";
  static const SETUPBUSSINESS = "/setupbussiness";
  static const CREATESTORE = "/createStore";
  static const SUBMITSCREEN = "/submitscreen";
  static const APPROVEDSTATUS = "/approvedstatus";
  static const SIGNUP = "/signup";
  static const DASHBOARDSCREEN = "/dashboardscreen";
  static const CUSTOMERORDER = "/customerorder";

  static const PRODUCTFORMSCREEN = "/productformscreen";
  static const PRODUCTDETAILS = "/productdetails";

  static const TRANSACTIONHISTORY = "/transationhistory";

  static const INSIGHTSHISTORY = "/insightshistory";

  static const DETAILSBUSSINESS = "/detailsbussiness";

  static const STOREMANAGEMENT = "/storemanagement";

  static const SETTING = "/settings";

  static const FORGETPASSWORD = "/forgetpassword";
  static const VERIFYPASSWORD = "/verifypassword";

  static const FORGETNEWPASSWORD = "/forgetnewpassword";

  static const UPDATESTORE = "/updatestore";
  static const OTPSCREEN = "/otpscreen";
}

GoRoute animatedGoRoute({
  required String path,
  required String name,
  ExitCallback? onExitPage,
  required Widget Function(BuildContext, GoRouterState) pageBuilder,
}) {
  return GoRoute(
    path: path,
    name: name,
    onExit: onExitPage,
    pageBuilder: (context, state) => CustomTransitionPage<void>(
      key: state.pageKey,
      transitionDuration: const Duration(milliseconds: 400),
      child: pageBuilder(context, state),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}

class CustomSlideTransition extends CustomTransitionPage<void> {
  CustomSlideTransition({super.key, required super.child})
      : super(
          transitionDuration: const Duration(milliseconds: 250),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1.5, 0), end: Offset.zero).chain(
                  CurveTween(curve: Curves.bounceIn),
                ),
              ),
              child: child,
            );
          },
        );
}
