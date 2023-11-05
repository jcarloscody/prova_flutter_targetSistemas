import 'package:prova_flutter/app/core/modules/prova_flutter_modules.dart';
import 'package:prova_flutter/app/modules/home/home_controller.dart';
import 'package:prova_flutter/app/modules/home/home_page.dart';
import 'package:provider/provider.dart';

class HomeModule extends ProvaFlutterModules {
  HomeModule()
      : super(
          providers: [
            Provider(
              create: (context) => HomeController(),
            ),
          ],
          rotas: {
            "/home": (context) => const HomePage(),
          },
        );
}
