import 'package:firebase_auth/firebase_auth.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';

abstract class AuthenticationService {
  Stream<UserModel> retriveCurrenUser();
  Future<UserCredential?> signup(UserModel user);
  Future<UserCredential?> signin(UserModel user);
  Future<void> verifyEmail();
  Future<void> signout();
}

class AuthenticationServiceImpl extends AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<UserModel> retriveCurrenUser() {
    return auth.authStateChanges().map((User? user) {
      if (user != null) {
        return UserModel(uid: user.uid, email: user.email);
      } else {
        return UserModel(uid: 'uid');
      }
    });
  }

  @override
  Future<UserCredential?> signup(UserModel user) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: user.email!, password: user.password!);
      verifyEmail();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<UserCredential?> signin(UserModel user) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: user.email!, password: user.password!);
      print('user credential ===> $userCredential');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> verifyEmail() async {
    User? user = auth.currentUser;
    if (user != null && !user.emailVerified) {
      return await user.sendEmailVerification();
    }
  }

  @override
  Future<void> signout() async {
    return await auth.signOut();
  }
}
