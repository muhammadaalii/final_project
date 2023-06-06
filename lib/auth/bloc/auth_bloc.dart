// ignore_for_file: depend_on_referenced_packages, void_checks

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/repositories/user_repositories.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository;
  AuthBloc({UserRepository? userRepository})
      : userRepository = userRepository ?? UserRepository(),
        super(AuthInitial()) {

    on<AuthEvent>((event, emit) async* {
  if (event is AppLoaded) {
    try {
      var isSignedIn = await userRepository!.isSignedIn();
      if (isSignedIn) {
        var user = await userRepository.getCurrentUser();
        if (user != null) {
          yield AuthenticateState(user: user);
        } else {
          yield UnAuthenticateState();
        }
      } else {
        yield UnAuthenticateState();
      }
    } catch (e) {
      yield UnAuthenticateState();
    }
  }
});

  }
}
