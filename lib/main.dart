import 'package:flutter/material.dart';
import 'package:untitled1/ui/auth/login_screen.dart';
import 'package:untitled1/ui/auth/register_screen.dart';
import 'package:untitled1/ui/home/home.dart';

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
      initialRoute:LoginScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
       RegisterScreen.routeName:(context)=>RegisterScreen(),
        LoginScreen.routeName:(context)=>LoginScreen()
      },
    );
  }
}


