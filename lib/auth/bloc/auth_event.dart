part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthEvent {}

class AuthenticateState extends AuthState {
  User user;
  AuthenticateState({required this.user});
}

//
class UnAuthenticateState extends AuthState {}