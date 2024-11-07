import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:practice/home_page.dart';
import 'package:practice/increment_bloc.dart';
import 'package:practice/increment_provider.dart';
import 'package:practice/location_page.dart';
import 'package:practice/sms_page.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IncrementProvider(),
        ),
        // BlocProvider(
        //   create: (context) => IncrementBloc(),
        // )
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

