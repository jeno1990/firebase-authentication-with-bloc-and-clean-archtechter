import 'package:firebase_auth/firebase_auth.dart';
import 'package:interns_blog/features/auth/data/remoteDataSrouce/authentication_service.dart';

import '../../domain/repository/auth_repository.dart';
import '../../domain/entities/user_entity.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationService service = AuthenticationServiceImpl();

  @override
  Stream<UserModel> getCurrentUser() {
    return service.retriveCurrenUser();
  }

  @override
  Future<String?> retrieveUserName(UserModel user) async {
    await Future.delayed(const Duration(seconds: 2));
    return 'exampleUser';
  }

  @override
  Future<UserCredential?> signIn(UserModel user) {
    try {
      return service.signin(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signOut() {
    return service.signout();
  }

  @override
  Future<UserCredential?> signUp(UserModel user) {
    try {
      return service.signup(user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }
}
