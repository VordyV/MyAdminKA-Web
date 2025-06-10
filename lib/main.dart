import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'dependencies.dart';

void main() {
  usePathUrlStrategy();

  Repositories.setup();

  runApp(App());
}