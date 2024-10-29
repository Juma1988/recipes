import 'package:app/core/design/navigator.dart';
import 'package:app/core/design/theme.dart';
import 'package:app/core/logic/service_locator.dart';
import 'package:app/pages/email.dart';
import 'package:app/pages/home_screen.dart';
import 'package:app/pages/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

late int initScreen;

Future<void> main() async {
  initServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ProjectAmit63',
        navigatorKey: navigatorKey,
        home:  HomeScreen(),
        theme: lightMode,
        darkTheme: darkMode,
      ),
    );
  }
}

/*
git add .
git commit -m " **commit** "
git push origin main
 */
