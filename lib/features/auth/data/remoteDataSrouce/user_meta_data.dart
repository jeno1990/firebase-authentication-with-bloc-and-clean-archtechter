import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';

abstract class UserDatabase {
  Future<List<UserModel>> retriveUsersData();
  Future<void> addUserData(UserModel user);
}

class UserDatabaseImpl implements UserDatabase {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Future<void> addUserData(UserModel user) async {
    try {
      await _db.collection('users').doc(user.uid).set(user.toMap());
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.plugin);
    }
  }

  @override
  Future<List<UserModel>> retriveUsersData() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await _db.collection('users').get();
    return snapshot.docs
        .map((snapshot) => UserModel.fromDocumentSnapShot(snapshot))
        .toList();
  }

  Future<String> retriveUserName(UserModel user) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _db.collection('users').doc(user.uid).get();
      return snapshot.data()!['displayName'];
    } on FirebaseException catch (e) {
      throw FirebaseException(plugin: e.plugin);
    }
  }
}
