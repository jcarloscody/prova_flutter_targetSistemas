import 'package:flutter/material.dart';

class ProvaFlutterNavigator {
  ProvaFlutterNavigator._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get to => navigatorKey.currentState!;
}
