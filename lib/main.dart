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
      child: Consumer<AppProvider>(
        builder: (context, value, child) {
          return MaterialApp(
            title: 'Practice',
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                useMaterial3: true,
                primaryColor: Colors.grey.shade900,
                textTheme: TextTheme(
                  bodySmall:
                      TextStyle(color: Colors.grey.shade800, fontSize: 15),
                  bodyMedium:
                      const TextStyle(color: Colors.black, fontSize: 17),
                ),
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.grey.shade900),
                  backgroundColor: Colors.indigo.shade200,
                  titleTextStyle: const TextStyle(color: Colors.black, fontSize: 22)
                ),
                iconTheme: IconThemeData(color: Colors.grey.shade900)),
            themeMode: context.watch<AppProvider>().isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            darkTheme: ThemeData(
                scaffoldBackgroundColor: Colors.grey.shade900,
                useMaterial3: true,
                primaryColor: Colors.grey.shade200,
                textTheme: const TextTheme(
                  bodySmall: TextStyle(color: Colors.white70, fontSize: 15),
                  bodyMedium: TextStyle(color: Colors.white, fontSize: 17),
                ),
                appBarTheme: AppBarTheme(
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: Colors.indigo.shade400,
                    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22)
                ),
                iconTheme: const IconThemeData(color: Colors.white)),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
