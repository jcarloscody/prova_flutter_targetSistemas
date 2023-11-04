import 'package:flutter/material.dart';
import 'package:prova_flutter/app/core/modules/prova_flutter_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class ProvaFlutterModules {
  final Map<String, WidgetBuilder> _rotas;
  final List<SingleChildWidget>? _providers;

  ProvaFlutterModules(
      {required Map<String, WidgetBuilder> rotas,
      List<SingleChildWidget>? providers})
      : _rotas = rotas,
        _providers = providers;

  Map<String, WidgetBuilder> get rotas => _rotas.map(
        (key, pageBuilder) => MapEntry(
          key,
          (context) =>
              ProvaFlutterPage(page: pageBuilder, providers: _providers),
        ),
      );

  Widget getPage({required String path}) {
    final widgetBuilder = _rotas[path];
    if (widgetBuilder != null) {
      return ProvaFlutterPage(
        page: widgetBuilder,
        providers: _providers,
      );
    }
    throw Exception();
  }
}
