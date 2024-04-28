import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled1/firebase/firebase_function.dart';
import 'package:untitled1/firebase/user_modle.dart';

class MyProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModle? userModle;

  MyProvider(){
    firebaseUser=FirebaseAuth.instance.currentUser;
    if(firebaseUser !=null){
      initUser();

    }

  }

 initUser()async{
    userModle = await FirebaseFunction.readUser();

    notifyListeners();
  }
}