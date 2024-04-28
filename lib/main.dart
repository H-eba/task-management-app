
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/provider/my_provider.dart';
import 'package:untitled1/ui/auth/login_screen.dart';
import 'package:untitled1/ui/auth/register_screen.dart';
import 'package:untitled1/ui/edit_screen/edit_screen.dart';
import 'package:untitled1/ui/home/home.dart';

import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(create: (context)=>MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:provider.firebaseUser !=null?
          HomeScreen.routeName:
      RegisterScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
       RegisterScreen.routeName:(context)=>RegisterScreen(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        EditScreen.routeName:(context)=>EditScreen()

      },
    );
  }
}


