import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:final_project/config/palette.dart';
import 'package:final_project/widgets/reusable_widget.dart';
import 'package:final_project/logout/bloc/logout_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/screens/screens.dart';
import 'package:final_project/repositories/user_repositories.dart';
import 'package:final_project/logout/sign_out.dart';




class Settings extends StatelessWidget {
  Logout logout = Logout();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LogoutBloc>(
      create: (context) => LogoutBloc(userRepository: UserRepository()),
      child: BlocListener<LogoutBloc, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSucceeded) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInScreen(),
              ),
            );
          }
        },
        child: BlocBuilder<LogoutBloc, LogoutState>(
          builder: (context, state) {
            final logoutBloc = BlocProvider.of<LogoutBloc>(context);
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      'Settings',
                      style: const TextStyle(
                        color: Palette.facebookBlue,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.2,
                      ),
                    ),
                    centerTitle: false,
                    floating: true,
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection('users').snapshots(),
                        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return ListView(
                            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                              return Text(
                                'Hello, ${document['name']}\nPhone Number: ${document['phone_number']}\nCountry: ${document['country']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.0,
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: signOutButton(context, () {
                      logout.logOut(context);
                      //logoutBloc.add(LogoutButtonPressed());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
