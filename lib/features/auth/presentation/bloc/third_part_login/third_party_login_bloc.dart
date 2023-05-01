import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/repository/auth_repository.dart';

part 'third_party_login_event.dart';
part 'third_party_login_state.dart';

class ThirdPartyLoginBloc
    extends Bloc<ThirdPartyLoginEvent, ThirdPartyLoginState> {
  final AuthenticationRepository authenticationRepository;
  ThirdPartyLoginBloc({required this.authenticationRepository})
      : super(ThirdPartyLoginInitial()) {
    on<SignInWithGoogleEvent>(_onSignWithGoogle);
  }
  void _onSignWithGoogle(
      SignInWithGoogleEvent event, Emitter<ThirdPartyLoginState> emit) async {
    emit(ThirdPartyLoginLoadingState());

    UserCredential? userCredential =
        await authenticationRepository.signInWithGoogle();

    if (userCredential == null) {
      emit(ThidPartLoginFailedState());
    }
    emit(ThirdPartyLoginSuccessState());
  }
}
