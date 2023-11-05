import 'package:flutter/material.dart';
import 'package:prova_flutter/app/models/user_model.dart';
import 'package:prova_flutter/app/repositories/auth/auth_repository.dart';
import 'package:http/http.dart' as http;

class IauthRepository extends AuthRepository {
  Future<UserModel?> auth(
      {required String usuario, required String senha}) async {
    // var result =
    //     await http.get(Uri.parse("http://localhost:8080/users?name=$usuario"));

    // if (result.statusCode != 200) {
    //   return throw Exception(
    //       "Erro na conexão com o servidor. Entre em contato com o help desk!");
    // }

    // debugPrint(result.body);

    // if (result.body == '{}') {
    //   return null;
    // }

    // return UserModel.fromJson(result.body);

    return UserModel(
        id: 1, name: "josue", email: "josue@gmail.com", password: "123456789");
  }
}
