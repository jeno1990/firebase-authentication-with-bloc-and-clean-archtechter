import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';

import '../../../domain/repository/auth_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;
  AuthenticationBloc({required this.authenticationRepository})
      : super(AuthenticationInitial()) {
    on<AuthStartedEvent>(_onAuthStarted);
    on<AuthSignoutEvent>(_onAuthSignout);
  }
  void _onAuthStarted(
      AuthStartedEvent event, Emitter<AuthenticationState> emit) async {
    // emit(AuthenticationLoadingState());
    UserModel user = await authenticationRepository.getCurrentUser().first;
    if (user.uid != 'uid') {
      //? means user exist
      // String? displayName =
      //     await authenticationRepository.retrieveUserName(user);
      emit(AuthSuccessState(user: user));
    } else {
      emit(AuthFailureState());
    }
  }

  void _onAuthSignout(
      AuthSignoutEvent event, Emitter<AuthenticationState> emit) async {
    // emit(AuthenticationLoadingState());
    await authenticationRepository.signOut();
  }
}
