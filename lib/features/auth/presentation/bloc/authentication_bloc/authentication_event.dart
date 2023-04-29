part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthStartedEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}

class AuthSignoutEvent extends AuthenticationEvent {
  @override
  List<Object> get props => [];
}
