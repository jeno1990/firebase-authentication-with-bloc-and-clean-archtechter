part of 'user_data_bloc.dart';

abstract class UserDataEvent extends Equatable {
  const UserDataEvent();

  @override
  List<Object> get props => [];
}

class UserDataFetchEvent extends UserDataEvent {
  final String? displayName;

  const UserDataFetchEvent({this.displayName});
}
