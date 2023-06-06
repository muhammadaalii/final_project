import 'package:flutter/material.dart';
import 'package:final_project/widgets/reusable_widget.dart';
import 'package:final_project/screens/screens.dart';
import 'package:final_project/utils/color_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignUpSecondScreen extends StatefulWidget {
  const SignUpSecondScreen({ Key? key }) : super(key: key);

  @override
  _SignUpSecondScreenState createState()  => _SignUpSecondScreenState();
}

class _SignUpSecondScreenState extends State<SignUpSecondScreen> {
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _phoneNumberTextController = TextEditingController();
  TextEditingController _countryTextController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: const Text(
                  "User Information",
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
                          "Enter Full Name",
                          Icons.person_outline,
                          false,
                          _nameTextController,
                        ),
                        const SizedBox(height: 20),
                        reusableTextField(
                          "Enter Phone Number",
                          Icons.phone,
                          false,
                          _phoneNumberTextController,
                        ),
                        const SizedBox(height: 20),
                        reusableTextField(
                          "Enter Country",
                          Icons.location_on,
                          false,
                          _countryTextController,
                        ),
                        const SizedBox(height: 20),
                        signInSignUpButton(context, false, () {
                          Map<String, dynamic> data = {
                            'name': _nameTextController.text,
                            'phone_number': _phoneNumberTextController.text,
                            'country': _countryTextController.text,
                          };

                          FirebaseFirestore.instance.collection('users').add(data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInScreen(),
                              ),);
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}