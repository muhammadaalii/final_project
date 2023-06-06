import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:final_project/repositories/user_repositories.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  UserRepository userRepository;
  RegisterBloc({UserRepository? userRepository})
      : userRepository = userRepository ?? UserRepository(),
        super(RegisterInitial()) {
    @override
    Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
      if (event is SignUpButtonPressed) {
      yield RegisterLoading();

      try {
          User? user = await userRepository!.signUp(event.email, event.password);
          if (user != null) {
            yield RegisterSucced(user: user);
          } else {
            yield RegisterFailed(message: 'User registration failed.');
          }
        } catch (e) {
          yield RegisterFailed(message: e.toString());
        }
      }
    };
  }
}