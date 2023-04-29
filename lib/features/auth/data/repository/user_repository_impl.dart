import 'package:interns_blog/features/auth/data/remoteDataSrouce/user_meta_data.dart';
import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';
import 'package:interns_blog/features/auth/domain/repository/user_repositoy.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatabaseImpl fireStoreDb = UserDatabaseImpl();
  @override
  Future<List<UserModel>> retiriveUserData() async {
    return await fireStoreDb.retriveUsersData();
  }

  @override
  Future<void> saveUserData(UserModel user) async {
    return await fireStoreDb.addUserData(user);
  }
}
