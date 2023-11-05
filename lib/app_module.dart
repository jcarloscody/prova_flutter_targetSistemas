import 'package:flutter/material.dart';
import 'package:prova_flutter/app/repositories/auth/auth_repository.dart';
import 'package:prova_flutter/app/repositories/auth/iauth_repository.dart';
import 'package:prova_flutter/app/services/auth/auth_service.dart';
import 'package:prova_flutter/app/services/auth/iauth_service.dart';
import 'package:prova_flutter/app_widget.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(
          create: (context) => IauthRepository(),
        ),
        Provider<AuthService>(
          create: (context) => IauthService(
            authRepositorie: context.read<AuthRepository>(),
          ),
        ),
      ],
      child: const AppWidget(),
    );
  }
}
