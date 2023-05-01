part of 'third_party_login_bloc.dart';

abstract class ThirdPartyLoginEvent extends Equatable {
  const ThirdPartyLoginEvent();

  @override
  List<Object> get props => [];
}

class SignInWithGoogleEvent extends ThirdPartyLoginEvent {
  @override
  List<Object> get props => [];
}
