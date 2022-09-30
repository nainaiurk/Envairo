import 'package:envairo/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 63, 243, 156),
          titleTextStyle: TextStyle(color: Colors.white)
        ),
        primaryTextTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white)
        )
      ),
      home: const HomePage(),
    );
  }
}