import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/navigator/prova_flutter_navigator.dart';
import 'package:prova_flutter/app/modules/auth/auth_page.dart';
import 'package:prova_flutter/app/modules/home/home_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: ProvaFlutterNavigator.navigatorKey,
      routes: {
        ...HomeModule().rotas,
      },
      home: const AuthPage(),
    );
  }
}
