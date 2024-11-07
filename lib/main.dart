import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:practice/increment_bloc.dart';
import 'package:practice/increment_provider.dart';
import 'package:provider/provider.dart';

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
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Practice"),
      ),
      body: Center(
        child: Text(
          '${context.watch<IncrementProvider>().lat} === ${context.watch<IncrementProvider>().lon}\n${context.watch<IncrementProvider>().address}',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25),
        ),
      ),
      // Center(
      //   child: Text(
      //     context.watch<IncrementProvider>().number.toString(),
      //     style: const TextStyle(
      //         fontWeight: FontWeight.bold, color: Colors.white, fontSize: 25),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<IncrementProvider>().getLocation();
          // context.read<IncrementProvider>().incrementNumber();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
