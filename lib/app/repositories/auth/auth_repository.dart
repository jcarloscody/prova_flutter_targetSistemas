import 'package:prova_flutter/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel?> auth({required String usuario, required String senha});
}
