import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';

abstract class AuthenticationService {
  Stream<UserModel> retriveCurrenUser();
  Future<UserCredential?> signup(UserModel user);
  Future<UserCredential?> signin(UserModel user);
  Future<void> verifyEmail();
  Future<void> signout();
  Future<UserCredential> signInWithGoogle();
}

class AuthenticationServiceImpl extends AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
  Future<UserCredential> signInWithGoogle() async {
    try {
      // bigin interactive sign in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      // obtain auth derails from requrest
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      // create a new credentilal for user
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // finally sign in
      return await auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code, message: e.message);
    }
  }

  @override
  Future<void> signout() async {
    return await auth.signOut();
  }
}
