import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.LightTheme,
      initialRoute: HomeScreen.routeName,

      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
