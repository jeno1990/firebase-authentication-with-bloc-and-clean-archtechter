part of 'form_bloc.dart';

enum Status { signIn, signUp }

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object> get props => [];
}

class EmailChagedEvent extends FormEvent {
  final String email;

  const EmailChagedEvent({required this.email});
  @override
  List<Object> get props => [];
}

class PasswordChangedEvent extends FormEvent {
  final String password;

  const PasswordChangedEvent({required this.password});
  @override
  List<Object> get props => [];
}

class NameChangedEvent extends FormEvent {
  final String displayName;

  const NameChangedEvent({required this.displayName});
  @override
  List<Object> get props => [];
}

class AgeChagedEvent extends FormEvent {
  final int age;

  const AgeChagedEvent({required this.age});
  @override
  List<Object> get props => [];
}

class FormSubmitedEvent extends FormEvent {
  final Status value;

  const FormSubmitedEvent({required this.value});
  @override
  List<Object> get props => [];
}

class FormSuccededEvent extends FormEvent {
  @override
  List<Object> get props => [];
}

class EmailFieldTouchedEvent extends FormEvent {
  @override
  List<Object> get props => [];
}
