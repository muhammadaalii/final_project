import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/repositories/user_repositories.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository userRepository;
  LoginBloc({UserRepository? userRepository})
      : userRepository = userRepository ?? UserRepository(),
        super(LoginInitial()) {
    on<LoginEvent>((event, emit) async* {
      if (event is SignInButtonPressed) {
      yield LoginLoading();

      try {
      User? user = await userRepository!.signIn(event.email, event.password);
      if (user != null) {
        yield LoginSucced(user: user);
      } else {
        yield LoginFailed(message: 'Login failed. Invalid credentials.');
      }
    } catch (e) {
      yield LoginFailed(message: e.toString());
    }
  }
});
  }
}
