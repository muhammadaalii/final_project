import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/bloc/model/user_model.dart';
import 'package:final_project/bloc/repo/user_repo.dart';
import 'package:final_project/bloc/ui_bloc/bloc.dart';
import 'package:final_project/bloc/ui_bloc/events.dart';
import 'package:final_project/bloc/ui_bloc/states.dart';
import 'package:final_project/config/palette.dart';
import 'package:flutter/services.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(UserRepository()),
          
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
            'Friends List',
            style: const TextStyle(
              color: Palette.facebookBlue,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.2,
            ),
            ),
            centerTitle: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
 
          body: blocBody()),
    );
  }

  Widget blocBody() {
    return BlocProvider(
      create: (context) => UserBloc(
        UserRepository(),
      )..add(LoadUserEvent()),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserErrorState) {
            return const Center(child: Text("Error"));
          }
          if (state is UserLoadedState) {
            List<UserModel> userList = state.users;
            return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Card(
                        color: Palette.facebookBlue,
                        child: ListTile(
                            title: Text(
                              '${userList[index].firstName}  ${userList[index].lastName}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              '${userList[index].email}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  userList[index].avatar.toString()),
                            ))),
                  );
                });
          }

          return Container();
        },
      ),
    );
  }
}
