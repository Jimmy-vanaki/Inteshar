import 'package:Inteshar/app/config/constants.dart';
import 'package:Inteshar/app/config/theme.dart';
import 'package:Inteshar/app/core/init/init.dart';
import 'package:Inteshar/app/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final bool darkMode =
      Constants.localStorage.read('settings')?['darkMode'] ?? false;
  runApp(MyApp(darkMode: darkMode));
}

class MyApp extends StatelessWidget {
  final bool darkMode;

  const MyApp({super.key, required this.darkMode});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      title: Constants.appTitle,
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      darkTheme: MyThemes.darkTheme,
      theme: MyThemes.lightTheme,
      initialRoute: Routes.splash,
      getPages: Routes.pages,
    );
  }
}
