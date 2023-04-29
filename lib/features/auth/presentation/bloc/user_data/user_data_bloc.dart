import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:interns_blog/features/auth/data/remoteDataSrouce/user_meta_data.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/repository/user_repositoy.dart';

part 'user_data_event.dart';
part 'user_data_state.dart';

class UserDataBloc extends Bloc<UserDataEvent, UserDataState> {
  final UserRepository userRepository;
  UserDataBloc({required this.userRepository}) : super(UserDataInitial()) {
    on<UserDataFetchEvent>(_onUserFetch);
  }
  void _onUserFetch(
      UserDataFetchEvent event, Emitter<UserDataState> emit) async {
    emit(UserDataLoadingState());
    List<UserModel> users = await userRepository.retiriveUserData();
    emit(UserDataSuccessState(userList: users, displayName: event.displayName));
  }
}
