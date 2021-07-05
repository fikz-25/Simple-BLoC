import 'package:flutter/material.dart';
import 'package:simple_bloc/UI/home_screen/view.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => HomeScreen(),
      },
    );
  }
}
