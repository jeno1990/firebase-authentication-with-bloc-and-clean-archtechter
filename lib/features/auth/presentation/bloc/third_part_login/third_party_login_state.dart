part of 'third_party_login_bloc.dart';

abstract class ThirdPartyLoginState extends Equatable {
  const ThirdPartyLoginState();

  @override
  List<Object> get props => [];
}

class ThirdPartyLoginInitial extends ThirdPartyLoginState {}

class ThirdPartyLoginLoadingState extends ThirdPartyLoginState {}

class ThirdPartyLoginSuccessState extends ThirdPartyLoginState {}

class ThidPartLoginFailedState extends ThirdPartyLoginState {}
