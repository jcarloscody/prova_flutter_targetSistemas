import 'package:prova_flutter/app/core/modules/prova_flutter_modules.dart';
import 'package:prova_flutter/app/modules/auth/auth_page.dart';
import 'package:provider/provider.dart';

class AuthModule extends ProvaFlutterModules {
  AuthModule()
      : super(
          providers: [
            Provider(
              create: (context) => Object(),
            )
          ],
          rotas: {
            "/": (context) => const AuthPage(),
          },
        );
}
