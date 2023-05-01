import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_entity.dart';

abstract class AuthenticationRepository {
  Stream<UserModel> getCurrentUser();
  Future<UserCredential?> signUp(UserModel user);
  Future<UserCredential?> signIn(UserModel user);
  Future<void> signOut();
  Future<String?> retrieveUserName(UserModel user);
  Future<UserCredential?> signInWithGoogle();
}
