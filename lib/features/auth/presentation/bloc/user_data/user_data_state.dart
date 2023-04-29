part of 'user_data_bloc.dart';

abstract class UserDataState extends Equatable {
  const UserDataState();

  @override
  List<Object> get props => [];
}

class UserDataInitial extends UserDataState {}

class UserDataSuccessState extends UserDataState {
  final List<UserModel> userList;
  final String? displayName;

  const UserDataSuccessState({required this.userList, this.displayName});
  @override
  List<Object> get props => [userList];
}

class UserDataErrorState extends UserDataState {
  @override
  List<Object> get props => [];
}

class UserDataLoadingState extends UserDataState {
  @override
  List<Object> get props => [];
}
