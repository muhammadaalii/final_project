import 'package:final_project/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Logout {

  void logOut(BuildContext context) async {
       await FirebaseAuth.instance.signOut();
       Navigator.popUntil(context, (route) => route.isFirst);
       Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen()));
  }
}