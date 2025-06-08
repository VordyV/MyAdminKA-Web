import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  usePathUrlStrategy();

  runApp(App());
}