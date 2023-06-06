// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:final_project/utils/color_utils.dart';
import 'package:final_project/widgets/reusable_widget.dart';
import 'package:final_project/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  _SignUpScreenState createState()  => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSucced) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        } else if (state is RegisterFailed) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignUpScreen()),
          );
          Text(state.message);
        }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          if (state is RegisterInitial) {
            return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      hexStringToColor("331CC7"),
                      hexStringToColor("23138B"),
                      hexStringToColor("190D63")
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        reusableTextField(
                          "Enter UserName",
                          Icons.person_outline,
                          false,
                          _userNameTextController,
                        ),
                        const SizedBox(height: 20),
                        reusableTextField(
                          "Enter Email Id",
                          Icons.person_outline,
                          false,
                          _emailTextController,
                        ),
                        const SizedBox(height: 20),
                        reusableTextField(
                          "Enter Password",
                          Icons.lock_outlined,
                          true,
                          _passwordTextController,
                        ),
                        const SizedBox(height: 20),
                        signInSignUpButton(context, false, () {
                          auth
                              .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text,
                              )
                              .then((value) {
                            print("Created New Account");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpSecondScreen(),
                              ),
                            );
                          }).catchError((error) {
                            print("Error ${error.toString()}");
                          });
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is RegisterLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

/*class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  /*Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("331CC7"),
            hexStringToColor("23138B"),
            hexStringToColor("190D63")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, (){
                      auth.createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                            print("Created New Account");
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                })
              ],
            ),
          ))),
    );
  }*/
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterInitial) {
          child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
              return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("331CC7"),
            hexStringToColor("23138B"),
            hexStringToColor("190D63")
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                signInSignUpButton(context, false, (){
                      auth.createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                          .then((value) {
                            print("Created New Account");
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                })
              ],
            ),
          ))),
    );
        },
      );
        }
        else if (state is RegisterLoading) {
          const Center(child: CircularProgressIndicator());
        }
        if (state is RegisterSucced) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => NavScreen()));
        }
        if (state is RegisterFailed) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
        }
      },
    );
  }
}*/


