import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvaFlutterPage extends StatelessWidget {
  final List<SingleChildWidget>? _providers;
  final WidgetBuilder _page;
  const ProvaFlutterPage({
    super.key,
    List<SingleChildWidget>? providers,
    required WidgetBuilder page,
  })  : _providers = providers,
        _page = page;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: _providers ??
          [
            Provider(
              create: (context) => Object(),
            ),
          ],
      child: Builder(builder: _page),
    );
  }
}
