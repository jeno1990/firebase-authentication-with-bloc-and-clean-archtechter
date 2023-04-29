import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';
import 'package:interns_blog/features/auth/domain/repository/user_repositoy.dart';

import '../../../domain/repository/auth_repository.dart';

part 'form_event.dart';
part 'form_state.dart';

class FormBloc extends Bloc<FormEvent, FormValidate> {
  final AuthenticationRepository authenticationRepository;
  final UserRepository databaseRepository;
  FormBloc(
      {required this.databaseRepository,
      required this.authenticationRepository})
      : super(
          const FormValidate(
              email: "example@gmail.com",
              age: 0,
              password: "",
              isEmailValid: false,
              isPasswordValid: true,
              isFormValid: false,
              isNameValid: true,
              isAgeValid: true,
              isFormValidateFaild: false,
              isLoading: false),
        ) {
    on<EmailChagedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<NameChangedEvent>(_onNameChanged);
    on<AgeChagedEvent>(_onAgeChanged);
    on<FormSubmitedEvent>(_onFormSubmitted);
    on<FormSuccededEvent>(_onFormSucceeded);
    on<EmailFieldTouchedEvent>(_onEmailTouched);
  }

  final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  bool _isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  bool _isNameValid(String? displayName) {
    return displayName!.isNotEmpty;
  }

  bool _isAgeValid(int age) {
    return age >= 1 && age <= 120 ? true : false;
  }

  void _onEmailChanged(EmailChagedEvent event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValid: false,
      isFormValidateFailed: false,
      errorMessage: "",
      email: event.email,
      isEmailValid: _isEmailValid(event.email),
    ));
  }

  void _onPasswordChanged(PasswordChangedEvent event, Emitter<FormState> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValidateFailed: false,
      errorMessage: "",
      password: event.password,
      isPasswordValid: _isPasswordValid(event.password),
    ));
  }

  void _onEmailTouched(
      EmailFieldTouchedEvent event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      emailTyped: true,
    ));
  }

  void _onNameChanged(NameChangedEvent event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValidateFailed: false,
      errorMessage: "",
      displayName: event.displayName,
      isNameValid: _isNameValid(event.displayName),
    ));
  }

  void _onAgeChanged(AgeChagedEvent event, Emitter<FormValidate> emit) {
    emit(state.copyWith(
      isFormSuccessful: false,
      isFormValidateFailed: false,
      errorMessage: "",
      age: event.age,
      isAgeValid: _isAgeValid(event.age),
    ));
  }

  void _onFormSubmitted(
      FormSubmitedEvent event, Emitter<FormValidate> emit) async {
    UserModel user = UserModel(
        email: state.email,
        password: state.password,
        age: state.age,
        displayName: state.displayName);

    if (event.value == Status.signUp) {
      await _updateUIAndSignUp(event, emit, user);
    } else if (event.value == Status.signIn) {
      await _authenticateUser(event, emit, user);
    }
  }

  void _onFormSucceeded(FormSuccededEvent event, Emitter<FormValidate> emit) {
    emit(state.copyWith(isFormSuccessful: true));
  }

  _updateUIAndSignUp(FormSubmitedEvent event, Emitter<FormValidate> emit,
      UserModel user) async {
    emit(
      state.copyWith(
          errorMessage: "",
          isFormValid: _isPasswordValid(state.password) &&
              _isEmailValid(state.email) &&
              _isAgeValid(state.age) &&
              _isNameValid(state.displayName),
          isLoading: true),
    );

    if (state.isFormValid) {
      try {
        UserCredential? authUser = await authenticationRepository.signUp(user);

        UserModel updatedUser = user.copyWith(
          uid: authUser!.user!.uid,
          isVerfied: authUser.user!.emailVerified,
        );
        // this section is to add user meta data to firebase firestore database
        await databaseRepository.saveUserData(updatedUser);

        if (updatedUser.isVerified != null && updatedUser.isVerified!) {
          emit(
            state.copyWith(isLoading: false, errorMessage: ""),
          );
        } else {
          emit(
            state.copyWith(
                isFormValid: false,
                errorMessage:
                    "Please Verify your email, by clicking the link sent to you by mail.",
                isLoading: false),
          );
        }
      } on FirebaseException catch (e) {
        emit(
          state.copyWith(
              isFormValid: false, errorMessage: e.message, isLoading: false),
        );
      }
    } else {
      emit(state.copyWith(
          isLoading: false, isFormValid: false, isFormValidateFailed: true));
    }
  }

  _authenticateUser(FormSubmitedEvent event, Emitter<FormValidate> emit,
      UserModel user) async {
    // print('sigin in form validation');
    emit(
      state.copyWith(
          errorMessage: "",
          isFormValid:
              _isPasswordValid(state.password) && _isEmailValid(state.email),
          isLoading: true),
    );
    // print(state.isFormValid);
    if (state.isFormValid) {
      try {
        UserCredential? authUser = await authenticationRepository.signIn(user);
        UserModel updatedUser =
            user.copyWith(isVerfied: authUser!.user!.emailVerified);
        if (authUser.user!.emailVerified) {
          updatedUser.isVerified = true;
        }
        print('-----------updated user ${updatedUser.isVerified}');
        if (updatedUser.isVerified!) {
          emit(state.copyWith(isLoading: false, errorMessage: ""));
        } else {
          emit(state.copyWith(
              isFormValid: false,
              errorMessage:
                  "Please Verify your email, by clicking the link sent to you by mail.",
              isLoading: false));
        }
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
            isLoading: false, errorMessage: e.message, isFormValid: false));
      }
    } else {
      emit(state.copyWith(
          isLoading: false, isFormValid: false, isFormValidateFailed: true));
    }
  }
}
