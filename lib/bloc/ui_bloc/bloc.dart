import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/bloc/repo/user_repo.dart';
import 'package:final_project/bloc/ui_bloc/events.dart';
import 'package:final_project/bloc/ui_bloc/states.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;

  UserBloc(this._userRepository) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      //just to show loader on UI for Presentation
      await Future.delayed(Duration(seconds: 3));
      try {
        final users = await _userRepository.getUsers();
        emit(UserLoadedState(users));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
  }
}
