import 'package:flutter/material.dart';
import 'package:practice/pages/home_page.dart';
import 'package:practice/state_manage/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('hi')],
      path: 'lang',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: true,
            primaryColor: Colors.grey.shade900),
        themeMode: ThemeMode.system,
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade900,
          useMaterial3: true,
          primaryColor: Colors.grey.shade200,
        ),
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        home: const HomePage(),
      ),
    );
  }
}

