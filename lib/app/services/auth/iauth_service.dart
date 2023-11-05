import 'package:prova_flutter/app/models/user_model.dart';
import 'package:prova_flutter/app/repositories/auth/auth_repository.dart';
import 'package:prova_flutter/app/services/auth/auth_service.dart';

class IauthService extends AuthService {
  final AuthRepository _authRepositorie;

  IauthService({required AuthRepository authRepositorie})
      : _authRepositorie = authRepositorie;

  @override
  Future<UserModel?> auth(
      {required String usuario, required String senha}) async {
    return _authRepositorie.auth(usuario: usuario, senha: senha);
  }
}
