import 'package:desktop_tutorial_2/screens/home_page.dart';
import 'package:desktop_tutorial_2/screens/splash.dart';
import 'package:desktop_tutorial_2/util/const.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowMinSize(const Size(700, 700));
    setWindowMaxSize(Size.infinite);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: Constants.darkTheme,
      home: SplashScreen(),
    );
  }
}
