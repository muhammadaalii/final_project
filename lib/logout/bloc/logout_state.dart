part of 'logout_bloc.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object?> get props => [];
}

class LogoutInitial extends LogoutState {
}

class LogoutSucceeded extends LogoutState {
}

class LogoutFailed extends LogoutState {
  final String error;

  LogoutFailed({required this.error});

  @override
  List<Object?> get props => [error];
}