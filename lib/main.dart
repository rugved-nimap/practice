import 'package:flutter/material.dart';
import 'package:practice/pages/home_page.dart';
import 'package:practice/state_manage/increment_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IncrementProvider(),
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
        home: const HomePage(),
      ),
    );
  }
}

