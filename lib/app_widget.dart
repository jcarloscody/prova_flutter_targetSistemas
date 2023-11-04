import 'package:flutter/material.dart';
import 'package:prova_flutter/app/modules/auth/auth_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {},
      home: AuthPage(),
    );
  }
}
