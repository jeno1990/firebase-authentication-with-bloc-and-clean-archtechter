part of 'form_bloc.dart';

abstract class FormState extends Equatable {
  const FormState();

  @override
  List<Object?> get props => [];
}

class FormInitial extends FormState {}

class FormValidate extends FormState {
  final String email;
  final String? displayName;
  final int age;
  final String password;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isFormValid;
  final bool isNameValid;
  final bool isAgeValid;
  final bool isFormValidateFaild;
  final bool isLoading;
  final String errorMessage;
  final bool isFormSuccessful;
  final bool emailTyped;
  const FormValidate(
      {this.emailTyped = false,
      required this.email,
      this.displayName,
      required this.age,
      required this.password,
      required this.isEmailValid,
      required this.isPasswordValid,
      required this.isFormValid,
      required this.isNameValid,
      required this.isAgeValid,
      required this.isFormValidateFaild,
      required this.isLoading,
      this.errorMessage = '',
      this.isFormSuccessful = false});

  FormValidate copyWith(
      {bool? emailTyped,
      String? email,
      String? password,
      String? displayName,
      bool? isEmailValid,
      bool? isPasswordValid,
      bool? isFormValid,
      bool? isLoading,
      int? age,
      String? errorMessage,
      bool? isNameValid,
      bool? isAgeValid,
      bool? isFormValidateFailed,
      bool? isFormSuccessful}) {
    return FormValidate(
        emailTyped: emailTyped ?? this.emailTyped,
        email: email ?? this.email,
        password: password ?? this.password,
        isEmailValid: isEmailValid ?? this.isEmailValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isFormValid: isFormValid ?? this.isFormValid,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        isNameValid: isNameValid ?? this.isNameValid,
        age: age ?? this.age,
        isAgeValid: isAgeValid ?? this.isAgeValid,
        displayName: displayName ?? this.displayName,
        isFormValidateFaild: isFormValidateFailed ?? isFormValidateFaild,
        isFormSuccessful: isFormSuccessful ?? this.isFormSuccessful);
  }

  @override
  List<Object?> get props => [
        emailTyped,
        email,
        password,
        isEmailValid,
        isPasswordValid,
        isFormValid,
        isLoading,
        errorMessage,
        isNameValid,
        displayName,
        age,
        isFormValidateFaild,
        isFormSuccessful
      ];
}
