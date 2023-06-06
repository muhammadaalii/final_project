// ignore_for_file: prefer_const_constructors
import 'package:final_project/auth/bloc/auth_bloc.dart';
import 'package:final_project/logout/bloc/logout_bloc.dart';
import 'package:final_project/repositories/user_repositories.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:final_project/config/palette.dart';
import 'package:final_project/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/register/bloc/register_bloc.dart';
import 'package:final_project/login/bloc/login_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
    apiKey: "AIzaSyC7WB0AW8KdH_VBy1XbrSsKMKQA_pHUcZM",
    authDomain: "finalproject-e8b7d.firebaseapp.com",
    projectId: "finalproject-e8b7d",
    storageBucket: "finalproject-e8b7d.appspot.com",
    messagingSenderId: "433984774773",
    appId: "1:433984774773:web:fd15a9a519880017634e3c",
    measurementId: "G-1X6TXL4X3S"
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => LogoutBloc(userRepository: UserRepository()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UnAuthenticateState) {
              return SignInScreen();
            } else if (state is AuthenticateState) {
              return NavScreen();
            }
            return SignInScreen();
          },
        ),
      ),
    );
  }
}


