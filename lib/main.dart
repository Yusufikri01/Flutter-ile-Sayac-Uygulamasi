import 'package:flutter/material.dart';
import 'package:percent_indicator_use/Pages/SetTimer.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          color: Colors.amber,
        )
      ),
      home: SelectTime(), // HomePage(), Time(),
    );
  }
}
