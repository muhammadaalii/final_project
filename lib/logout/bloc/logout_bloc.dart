import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:final_project/repositories/user_repositories.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  UserRepository userRepository;
  LogoutBloc({required this.userRepository}) : super(LogoutInitial());

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is LogoutButtonPressed) {
      try {
        userRepository.signOut();
        yield LogoutSucceeded();
      } catch (error) {
        yield LogoutFailed(error: error.toString());
      }
    }
  }
}
