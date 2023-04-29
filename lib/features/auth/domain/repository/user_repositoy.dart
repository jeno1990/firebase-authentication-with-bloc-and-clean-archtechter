import 'package:interns_blog/features/auth/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUserData(UserModel user);
  Future<List<UserModel>> retiriveUserData();
}
