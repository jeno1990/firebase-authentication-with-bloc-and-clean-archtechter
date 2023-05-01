import 'package:firebase_auth/firebase_auth.dart';
import 'package:interns_blog/features/auth/data/remoteDataSrouce/authentication_service.dart';

import '../../domain/repository/auth_repository.dart';
import '../../domain/entities/user_entity.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationService authService = AuthenticationServiceImpl();

  @override
  Stream<UserModel> getCurrentUser() {
    return authService.retriveCurrenUser();
  }

  @override
  Future<String?> retrieveUserName(UserModel user) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'exampleUser';
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    try {
      return authService.signin(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return authService.signout();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return authService.signup(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      return await authService.signInWithGoogle();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
