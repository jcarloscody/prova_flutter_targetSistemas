import 'package:prova_flutter/app/core/modules/prova_flutter_modules.dart';
import 'package:prova_flutter/app/modules/home/home_controller.dart';
import 'package:prova_flutter/app/modules/home/home_page.dart';
import 'package:prova_flutter/app/services/item/item_service.dart';
import 'package:provider/provider.dart';

class HomeModule extends ProvaFlutterModules {
  HomeModule()
      : super(
          providers: [
            Provider(
              create: (context) =>
                  HomeController(itemService: context.read<ItemService>()),
            ),
          ],
          rotas: {
            "/home": (context) => const HomePage(),
          },
        );
}
