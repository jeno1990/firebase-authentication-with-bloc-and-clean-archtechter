part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object?> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthSuccessState extends AuthenticationState {
  final UserModel user;

  const AuthSuccessState({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthFailureState extends AuthenticationState {
  @override
  List<Object> get props => [];
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  List<Object> get props => [];
}
