import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/src/core/routes/routes.dart';
import 'package:grocery_app/src/ui/splash/splash_screen.dart';
import 'package:grocery_app/utils/constants/color_constant.dart';
import 'package:grocery_app/utils/constants/string_constant.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApplication());
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return

        // ScreenUtilInit(
        //   designSize: const Size(360, 690),
        //   minTextAdapt: true,
        //   splitScreenMode: true,
        //   builder: (context, child) => GlobalLoaderOverlay(
        //     overlayColor: APPCOLOR.appGreen,
        //     useDefaultLoading: false,
        //     //  overlayWidgetBuilder: (progress) => const GlobalLoader(),
        //     child: MultiProvider(
        //       providers: [
        //         // ChangeNotifierProvider(create: (_) => PageNotifier()),
        //         // ChangeNotifierProvider(create: (_) => DaySelectionProvider()),
        //         // ChangeNotifierProvider(create: (_) => LoginProvider()),
        //         // ChangeNotifierProvider(create: (_) => ProductProvider()),
        //         // ChangeNotifierProvider(create: (_) => HomeProvider()),
        //       ],
        //       child: MaterialApp.router(
        //         routerConfig: MyRoutes.router,
        //         debugShowCheckedModeBanner: false,
        //         theme: ThemeData(
        //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //           scaffoldBackgroundColor: Colors.white,
        //           canvasColor: const Color.fromRGBO(255, 255, 255, 1),
        //           fontFamily: 'GoogleSans',
        //           primarySwatch: Colors.blue,
        //         ),
        //         themeMode: ThemeMode.light,
        //         title: APPSTRING.appName,
        //       ),
        //     ),
        //   ),
        // );

        MaterialApp.router(
      title: 'Customer App',
      routerConfig: MyRoutes.router,

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreen(),
    );
  }
}
