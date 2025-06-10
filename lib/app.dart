import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/pages.dart' as pages;
import 'settings.dart' as settings;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: settings.initialRoute,
        unknownRoute: GetPage(name: "/notfound", page: () => pages.ErrorPage(), binding: pages.ErrorBinding()),
        getPages: [
          GetPage(name: settings.Urls.main, page: () => pages.MainPage(), binding: pages.MainBinding(), transition: Transition.noTransition),
          GetPage(name: settings.Urls.authorization, page: () => pages.LoginPage(), binding: pages.LoginBinding(), transition: Transition.noTransition),
          GetPage(name: settings.Urls.registration, page: () => pages.RegisterPage(), binding: pages.RegisterBinding(), transition: Transition.noTransition),
        ]
    );
  }
}
