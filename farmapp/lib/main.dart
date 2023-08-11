import 'dart:ui';

import 'package:farmapp/LoginScreen/Login.dart';
import 'package:flutter/material.dart';

import 'SplashScreen/Splash.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: TAppTheme.lightTheme,
        // darkTheme: TAppTheme.darkTheme,
        // themeMode: ThemeMode.system,
        scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: Color.fromARGB(255, 247, 249, 251),
          body: SplashScreen(),
        ));
  }
}

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}
